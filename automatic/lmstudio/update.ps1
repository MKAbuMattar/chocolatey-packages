import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$downloadPage = 'https://lmstudio.ai/download'

# The nuspec links LM Studio's blog rather than a per-release page, so nothing in
# it changes with the version and AU has to leave it alone.
function global:au_SearchReplace { Get-AuSearchReplace -NoReleaseNotes }

function global:au_GetLatest {
  # LM Studio has no release API; the download page embeds the current version per platform
  # The page streams its data in Next.js chunks, so the JSON is split across
  # <script> boundaries. Drop the boundaries before matching, or the version and
  # the build number end up in different pieces.
  $page = (Invoke-WebRequest -Uri $downloadPage -UseBasicParsing).Content -replace '\\', ''
  $page = $page -replace '"\]\)</script><script>self\.__next_f\.push\(\[\d+,"', ''
  if ($page -notmatch '"win32":\{"x64":\{"version":"([\d.]+)","build":"(\d+)"') {
    throw "Could not find the win32/x64 version on $downloadPage"
  }
  $version, $build = $Matches[1], $Matches[2]

  # ponytail: package version ignores LM Studio's build number, matching how this
  # package has always been versioned. If a build-only respin ever needs shipping,
  # use Chocolatey fix notation (update.ps1 -Force) for that one release.
  @{
    Version = $version
    URL64   = "https://installers.lmstudio.ai/win32/x64/$version-$build/LM-Studio-$version-$build-x64.exe"
  }
}

update -ChecksumFor 64
