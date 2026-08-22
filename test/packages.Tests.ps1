$repoRoot = Split-Path $PSScriptRoot -Parent
$packageCases = @(
  Get-ChildItem (Join-Path $repoRoot 'automatic') -Directory |
    ForEach-Object { @{ Package = $_ } }
)

BeforeAll {
  # A new package is committed at 0.0.0 with an empty checksum, and the first AU run
  # resolves the real version, URL and checksum together. Any other package with a blank
  # checksum would install unverified software, so only 0.0.0 may have one.
  #
  # This is deliberately a rule and not a list of package names. Naming them would have
  # to be edited every time a package is added, and would quietly keep passing once AU
  # had filled the checksum in, which is exactly when the exemption should stop applying.

  function Get-PackagePaths {
    param([System.IO.DirectoryInfo]$Package)

    [pscustomobject]@{
      Id = $Package.Name
      Nuspec = Join-Path $Package.FullName "$($Package.Name).nuspec"
      Readme = Join-Path $Package.FullName 'README.md'
      Install = Join-Path $Package.FullName 'tools/chocolateyInstall.ps1'
      Update = Join-Path $Package.FullName 'update.ps1'
    }
  }

  function Get-PackageNuspec {
    param([string]$Path)

    $text = [IO.File]::ReadAllText($Path)
    [pscustomobject]@{
      Text = $text
      Xml = [xml]$text
    }
  }

  function Get-InstallUrls {
    param([string]$Text)

    [regex]::Matches(
      $Text,
      '(?im)^\s*url\w*\s*=\s*[''"]([^''"]*)'
    ) | ForEach-Object { $_.Groups[1].Value }
  }
}

Describe 'automatic package identity and metadata' {
  It '<Package.Name> has valid identity and metadata' -ForEach $packageCases {
    param($Package)
    $paths = Get-PackagePaths $Package
    $nuspec = Get-PackageNuspec $paths.Nuspec
    $metadata = $nuspec.Xml.package.metadata

    $paths.Id | Should -Be $paths.Id.ToLowerInvariant()
    ([string]$metadata.id) | Should -Be $paths.Id
    ([string]$metadata.version) | Should -Not -BeNullOrEmpty
    ([string]$metadata.version) | Should -Match '^\d+(?:\.\d+){1,3}(?:[-.][0-9A-Za-z.-]+)?$'
    $nuspec.Text | Should -Match '(?s)<description><!\[CDATA\[.*?\]\]></description>'
    ([string]$metadata.licenseUrl) | Should -Match '^https?://'
    ([string]$metadata.projectUrl) | Should -Match '^https?://'
    ([string]$metadata.releaseNotes) | Should -Not -BeNullOrEmpty
    Test-Path $paths.Readme | Should -BeTrue
    [IO.File]::ReadAllText($paths.Readme) | Should -Match '^\s*#\s+\S+'
    Test-Path $paths.Install | Should -BeTrue
  }
}

Describe 'automatic package descriptions' {
  It '<Package.Name> has a description matching its README' -ForEach $packageCases {
    param($Package)
    $paths = Get-PackagePaths $Package
    $nuspec = Get-PackageNuspec $paths.Nuspec
    $readme = [IO.File]::ReadAllText($paths.Readme)
    $body = $readme -replace '^\s*#\s+[^\r\n]*\r?\n\s*', ''
    $nl = if ($nuspec.Text -match "`r`n") { "`r`n" } else { "`n" }
    $body = ($body.TrimEnd() -replace "`r`n", "`n") -replace "`n", $nl
    $description = [regex]::Match(
      $nuspec.Text,
      '(?s)<description><!\[CDATA\[(.*?)\]\]></description>'
    ).Groups[1].Value

    # Compare what the description says, not how it is laid out. AU drops the newline
    # after <![CDATA[ whenever it bumps a version, so asserting an exact layout here
    # fails every package AU has touched since the last sync, which says nothing about
    # whether the text is right.
    $description.Trim() | Should -Be $body.Trim()
  }
}

Describe 'automatic package checksums' {
  It '<Package.Name> has valid SHA-256 checksums' -ForEach $packageCases {
    param($Package)
    $paths = Get-PackagePaths $Package
    $nuspec = Get-PackageNuspec $paths.Nuspec
    $installText = [IO.File]::ReadAllText($paths.Install)
    $checksums = [regex]::Matches(
      $installText,
      '(?im)^\s*checksum(?!type)\w*\s*=\s*[''"]([^''"]*)'
    ) | ForEach-Object { $_.Groups[1].Value }

    foreach ($checksum in $checksums) {
      if ($checksum) {
        $checksum | Should -Match '^[0-9a-fA-F]{64}$'
      } else {
        # Awaiting its first AU run. See the note in BeforeAll.
        ([string]$nuspec.Xml.package.metadata.version) | Should -Be '0.0.0' -Because `
          "$($paths.Id) has a blank checksum, which is only allowed before AU has resolved the package"
      }
    }

    $checksumTypes = [regex]::Matches(
      $installText,
      '(?im)^\s*checksumType\w*\s*=\s*[''"]([^''"]*)'
    ) | ForEach-Object { $_.Groups[1].Value }
    foreach ($checksumType in $checksumTypes) {
      $checksumType | Should -Be 'sha256'
    }
  }
}

Describe 'automatic package download URLs' {
  It '<Package.Name> uses HTTPS download URLs' -ForEach $packageCases {
    param($Package)
    $paths = Get-PackagePaths $Package
    $urls = Get-InstallUrls ([IO.File]::ReadAllText($paths.Install))

    foreach ($url in $urls) {
      $url | Should -Match '^https://'
    }
  }
}

Describe 'automatic package version URLs' {
  It '<Package.Name> includes the package version in templated URLs' -ForEach $packageCases {
    param($Package)
    $paths = Get-PackagePaths $Package
    $version = [string](Get-PackageNuspec $paths.Nuspec).Xml.package.metadata.version
    $installText = [IO.File]::ReadAllText($paths.Install)
    $updateText = [IO.File]::ReadAllText($paths.Update)
    $urls = Get-InstallUrls $installText
    $templates = [regex]::Matches(
      $updateText,
      '(?im)^\s*URL\w*\s*=\s*[''"]([^''"]*)'
    ) | ForEach-Object { $_.Groups[1].Value } | Where-Object {
      $_ -match '\$(?:version|build)'
    }

    if ($templates) {
      $shortVersion = ($version -split '-')[0] -split '\.'
      $shortVersion = ($shortVersion | Select-Object -First 3) -join '.'
      ($urls -join "`n") | Should -Match ([regex]::Escape($shortVersion))
    }
  }
}
