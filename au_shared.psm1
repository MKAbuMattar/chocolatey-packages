<#
    .Synopsis
        Helpers shared by every automatic/<package>/update.ps1.

    .Description
        Almost every package in this repository is the same updater: read the newest
        GitHub release, turn its tag into a Chocolatey version, point url64 at one of
        its assets and the release notes at the release page. Keeping that copied into
        99 update.ps1 files meant a fix had to be applied 99 times, and in practice it
        never was.

        Each update.ps1 now imports this module and states only what is specific to
        its package: the repository, the asset it ships and, where upstream is awkward,
        the tag filter that finds the right release.

        The module is imported with -Global on purpose. AU calls au_GetLatest from
        inside its own module, so the helpers have to live in the global scope to be
        resolvable from there.
#>

# Chocolatey versions never carry the leading 'v' that most upstreams tag with.
$script:TagVersionPrefix = '^v'

function Get-GitHubHeaders {
    <#
        .Synopsis
            Authorization header for api.github.com, when a token is available.

        .Description
            Unauthenticated GitHub API calls are rate limited per IP, which a run over
            99 packages hits. CI always has a token; a local run without one still
            works, it just has fewer requests to spend.
    #>
    if ($Env:github_api_key) { @{ Authorization = "token $Env:github_api_key" } } else { @{} }
}

function Get-GitHubRelease {
    <#
        .Synopsis
            The release a package should track, as returned by the GitHub API.

        .Description
            With no filter this is /releases/latest, which never returns a
            pre-release. Any filter means the newest release is not necessarily the
            right one - monorepos tag several components, some upstreams publish
            build-tagged releases next to semver ones, others publish releases with no
            assets at all - so the release list is searched instead and pre-releases
            are skipped.

        .Parameter Repo
            owner/name on GitHub.

        .Parameter TagPrefix
            Only consider tags starting with this, for repositories that publish more
            than one component.

        .Parameter TagPattern
            Regular expression the tag has to match.

        .Parameter WithAsset
            Only consider releases that actually carry an asset with this name.

        .Parameter PerPage
            How many releases to look through.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Repo,
        [string]$TagPrefix,
        [string]$TagPattern,
        [string]$WithAsset,
        [int]$PerPage = 100
    )

    $headers = Get-GitHubHeaders

    if (!$TagPrefix -and !$TagPattern -and !$WithAsset) {
        return Invoke-RestMethod "https://api.github.com/repos/$Repo/releases/latest" -Headers $headers
    }

    $releases = Invoke-RestMethod "https://api.github.com/repos/$Repo/releases?per_page=$PerPage" -Headers $headers
    $release = $releases | Where-Object {
        -not $_.prerelease -and
        (!$TagPrefix -or $_.tag_name -like "$TagPrefix*") -and
        (!$TagPattern -or $_.tag_name -match $TagPattern) -and
        (!$WithAsset -or ($_.assets.name -contains $WithAsset))
    } | Select-Object -First 1

    if (!$release) {
        $wanted = @(
            if ($TagPrefix) { "tag starting with '$TagPrefix'" }
            if ($TagPattern) { "tag matching '$TagPattern'" }
            if ($WithAsset) { "asset '$WithAsset'" }
        ) -join ', '
        throw "No stable release of $Repo with $wanted in the last $PerPage releases"
    }

    $release
}

function Get-VersionFromTag {
    <#
        .Synopsis
            The Chocolatey version a release tag stands for.

        .Parameter Tag
            The upstream tag, such as 'v1.2.3' or 'desktop-v1.2.3'.

        .Parameter Prefix
            Component prefix to drop first, for repositories that tag more than one
            component. A leading 'v' is dropped either way.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Tag,
        [string]$Prefix
    )

    $version = $Tag
    if ($Prefix) { $version = $version -replace ('^' + [regex]::Escape($Prefix)), '' }
    $version -replace $script:TagVersionPrefix, ''
}

function Get-GitHubAssetUrl {
    <#
        .Synopsis
            Download URL of a named asset of a release.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Repo,
        [Parameter(Mandatory)][string]$Tag,
        [Parameter(Mandatory)][string]$Asset
    )

    "https://github.com/$Repo/releases/download/$Tag/$Asset"
}

function Get-GitHubReleaseNotesUrl {
    <#
        .Synopsis
            Release page of a tag, which is what the nuspec links as release notes.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Repo,
        [Parameter(Mandatory)][string]$Tag
    )

    "https://github.com/$Repo/releases/tag/$Tag"
}

function Get-GitHubMatchingAsset {
    <#
        .Synopsis
            The first asset of a release whose name matches a wildcard.

        .Description
            For upstreams whose file names do not track the tag, so the URL cannot be
            built by hand and has to come from the release itself.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]$Release,
        [Parameter(Mandatory)][string]$Pattern
    )

    $asset = $Release.assets | Where-Object { $_.name -like $Pattern } | Select-Object -First 1
    if (!$asset) { throw "No asset matching $Pattern in release $($Release.tag_name)" }
    $asset
}

function Get-GitHubLatest {
    <#
        .Synopsis
            The $Latest hashtable for a package that tracks a GitHub release.

        .Description
            Covers the shape almost every package in this repository has: version from
            the tag, url64 built from or found in the release assets, release notes
            pointing at the release page. Packages upstream is awkward about build the
            hashtable themselves from the smaller helpers here.

        .Parameter Repo
            owner/name on GitHub.

        .Parameter Asset
            Name of the asset to download. '{version}' and '{tag}' are replaced with
            the values resolved from the release.

        .Parameter AssetPattern
            Wildcard matched against the names the release actually carries, for
            upstreams whose file names do not track the tag. Use instead of -Asset.

        .Parameter RequireAsset
            Skip releases that do not carry -Asset, for upstreams that publish
            releases without the Windows build.

        .Parameter TagPrefix
            See Get-GitHubRelease. Also dropped from the tag to get the version.

        .Parameter TagPattern
            See Get-GitHubRelease.

        .Parameter NoReleaseNotes
            Leave ReleaseNotes out, for packages whose nuspec does not link the
            release page.

        .Parameter PerPage
            How many releases to look through, passed to Get-GitHubRelease. Raise it
            for repositories that publish more releases than the default before the
            one being tracked falls off the first page.

        .Example
            Get-GitHubLatest -Repo 'charmbracelet/crush' -Asset 'crush_{version}_Windows_x86_64.zip'

        .Example
            Get-GitHubLatest -Repo 'flet-dev/flet' -AssetPattern 'flet-windows.zip'
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string]$Repo,
        [string]$Asset,
        [string]$AssetPattern,
        [switch]$RequireAsset,
        [string]$TagPrefix,
        [string]$TagPattern,
        [switch]$NoReleaseNotes,
        [int]$PerPage = 100
    )

    if (!$Asset -and !$AssetPattern) { throw 'Get-GitHubLatest needs -Asset or -AssetPattern' }
    # Releases are filtered by asset name, which is only known once the release is
    # picked, so a templated name cannot be the thing releases are searched for.
    if ($RequireAsset -and $Asset -match '{(version|tag)}') {
        throw 'Get-GitHubLatest -RequireAsset needs a literal -Asset; use -AssetPattern instead'
    }

    $find = @{ Repo = $Repo; PerPage = $PerPage }
    if ($TagPrefix) { $find.TagPrefix = $TagPrefix }
    if ($TagPattern) { $find.TagPattern = $TagPattern }
    if ($RequireAsset) { $find.WithAsset = $Asset }

    $release = Get-GitHubRelease @find
    $tag = $release.tag_name
    $version = Get-VersionFromTag -Tag $tag -Prefix $TagPrefix

    $url = if ($AssetPattern) {
        (Get-GitHubMatchingAsset -Release $release -Pattern $AssetPattern).browser_download_url
    }
    else {
        $name = $Asset.Replace('{version}', $version).Replace('{tag}', $tag)
        Get-GitHubAssetUrl -Repo $Repo -Tag $tag -Asset $name
    }

    $latest = @{
        Version = $version
        URL64   = $url
    }
    if (!$NoReleaseNotes) { $latest.ReleaseNotes = Get-GitHubReleaseNotesUrl -Repo $Repo -Tag $tag }
    $latest
}

function Get-AuSearchReplace {
    <#
        .Synopsis
            The au_SearchReplace map every package in this repository uses.

        .Description
            AU rewrites the install script and the nuspec by regex. url64 and
            checksum64 live in tools\chocolateyInstall.ps1 and the release notes link
            in the nuspec, the same way in every package here.

        .Parameter NoReleaseNotes
            Leave the nuspec alone, for packages whose <releaseNotes> does not point
            at a per-release page and so never changes.
    #>
    [CmdletBinding()]
    param([switch]$NoReleaseNotes)

    # AU keeps the resolved values in $global:Latest. Qualified on purpose: an
    # unqualified $Latest is a local of AU's caller, which a module cannot see.
    $map = @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\s*url64\s*=\s*)('.*')"      = "`$1'$($global:Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($global:Latest.Checksum64)'"
        }
    }
    if (!$NoReleaseNotes) {
        $map["$($global:Latest.PackageName).nuspec"] = @{
            "(<releaseNotes>).*(</releaseNotes>)" = "`${1}$($global:Latest.ReleaseNotes)`$2"
        }
    }
    $map
}

Export-ModuleMember -Function Get-GitHubHeaders, Get-GitHubRelease, Get-VersionFromTag,
    Get-GitHubAssetUrl, Get-GitHubReleaseNotesUrl, Get-GitHubMatchingAsset,
    Get-GitHubLatest, Get-AuSearchReplace
