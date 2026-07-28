import-module Chocolatey-AU

$downloadPage = 'https://lmstudio.ai/download'

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
      "(^\s*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
  # LM Studio has no release API; the download page embeds the current version per platform
  $page = (Invoke-WebRequest -Uri $downloadPage -UseBasicParsing).Content -replace '\\', ''
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
