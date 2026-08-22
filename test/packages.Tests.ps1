$repoRoot = Split-Path $PSScriptRoot -Parent
$packageCases = @(
  Get-ChildItem (Join-Path $repoRoot 'automatic') -Directory |
    ForEach-Object { @{ Package = $_ } }
)
# These upstreams do not publish a checksum, so their package scripts retain an
# intentionally empty checksum placeholder.
$global:PackagesWithoutChecksums = @('copilot-cli', 'httpie-desktop')
# These packages predate the current writer and omit only the outer CDATA newlines.
$global:LegacyDescriptionFormatting = @(
  'flet', 'herdr', 'iwe', 'manta', 'ms-apm',
  'ms-coreutils', 'openfootmanager', 'openship', 'pdf-brain', 'sql-studio'
)

Describe 'automatic package metadata' {
  It '<Package.Name> has consistent metadata' -ForEach $packageCases {
    param($Package)
    $id = $Package.Name
    $nuspecPath = Join-Path $Package.FullName "$id.nuspec"
    $readmePath = Join-Path $Package.FullName 'README.md'
    $installPath = Join-Path $Package.FullName 'tools/chocolateyInstall.ps1'
    $nuspecText = [IO.File]::ReadAllText($nuspecPath)
    $nuspec = [xml]$nuspecText
    $readmeText = [IO.File]::ReadAllText($readmePath)

    $id | Should -Be $id.ToLowerInvariant()
    ([string]$nuspec.package.metadata.id) | Should -Be $id
    $version = [string]$nuspec.package.metadata.version
    $version | Should -Not -BeNullOrEmpty
    $version | Should -Match '^\d+(?:\.\d+){1,3}(?:[-.][0-9A-Za-z.-]+)?$'
    $nuspecText | Should -Match '(?s)<description><!\[CDATA\[.*?\]\]></description>'
    ([string]$nuspec.package.metadata.licenseUrl) | Should -Match '^https?://'
    ([string]$nuspec.package.metadata.projectUrl) | Should -Match '^https?://'
    ([string]$nuspec.package.metadata.releaseNotes) | Should -Not -BeNullOrEmpty
    $readmeText | Should -Match '^\s*#\s+\S+'
    Test-Path $installPath | Should -BeTrue

    $body = $readmeText -replace '^\s*#\s+[^\r\n]*\r?\n\s*', ''
    $nl = if ($nuspecText -match "`r`n") { "`r`n" } else { "`n" }
    $body = ($body.TrimEnd() -replace "`r`n", "`n") -replace "`n", $nl
    $description = [regex]::Match(
      $nuspecText,
      '(?s)<description><!\[CDATA\[(.*?)\]\]></description>'
    ).Groups[1].Value
    if ($id -in $global:LegacyDescriptionFormatting) {
      $description.Trim() | Should -Be $body.Trim()
    } else {
      $description | Should -Be "$nl$body$nl"
    }

    $installText = [IO.File]::ReadAllText($installPath)
    $updateText = [IO.File]::ReadAllText((Join-Path $Package.FullName 'update.ps1'))
    $checksums = [regex]::Matches(
      $installText,
      '(?im)^\s*checksum(?!type)\w*\s*=\s*[''"]([^''"]*)'
    ) | ForEach-Object { $_.Groups[1].Value }
    foreach ($checksum in $checksums) {
      if ($checksum) {
        $checksum | Should -Match '^[0-9a-fA-F]{64}$'
      } else {
        $id | Should -BeIn $global:PackagesWithoutChecksums
      }
    }
    $checksumTypes = [regex]::Matches(
      $installText,
      '(?im)^\s*checksumType\w*\s*=\s*[''"]([^''"]*)'
    ) | ForEach-Object { $_.Groups[1].Value }
    foreach ($checksumType in $checksumTypes) {
      $checksumType | Should -Be 'sha256'
    }

    $urls = [regex]::Matches(
      $installText,
      '(?im)^\s*url\w*\s*=\s*[''"]([^''"]*)'
    ) | ForEach-Object { $_.Groups[1].Value }
    foreach ($url in $urls) {
      $url | Should -Match '^https://'
    }

    $versionTemplates = [regex]::Matches(
      $updateText,
      '(?im)^\s*URL\w*\s*=\s*[''"]([^''"]*)'
    ) | ForEach-Object { $_.Groups[1].Value } | Where-Object {
      $_ -match '\$(?:version|build)'
    }
    if ($versionTemplates) {
      $shortVersion = ($version -split '-')[0] -split '\.'
      $shortVersion = ($shortVersion | Select-Object -First 3) -join '.'
      ($urls -join "`n") | Should -Match ([regex]::Escape($shortVersion))
    }
  }
}
