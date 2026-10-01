import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$cdn = 'https://mimocode-cdn.xiaomimimo.com/mimocode/mimodesktopai'

# The release notes link is the product site, which does not change per version.
function global:au_SearchReplace { Get-AuSearchReplace -NoReleaseNotes }

function global:au_GetLatest {
  # The download link Xiaomi gives out is XiaomiMiMo-AI-latest-x64-setup.exe, whose
  # contents change under one fixed URL: a package pinned to it fails its checksum on
  # the next release, which is how a rolling URL gets a package rejected. The same file
  # is published at XiaomiMiMo-AI-<version>-x64-setup.exe (same size and ETag), so the
  # package installs from that.
  #
  # The version is only inside the installer. NSIS keeps its version resource in the
  # loader at the start of the file, ahead of the 250 MB payload, so the first 2 MB is
  # enough to read it and AU downloads the whole file only when the version changes.
  # Invoke-WebRequest in Windows PowerShell 5.1 refuses a Range header, hence the
  # HttpWebRequest.
  $head = Join-Path ([IO.Path]::GetTempPath()) 'xiaomi-mimo-ai-head.exe'
  $request = [Net.HttpWebRequest]::Create("$cdn/XiaomiMiMo-AI-latest-x64-setup.exe")
  $request.AddRange(0, 2MB - 1)
  $response = $request.GetResponse()
  try {
    $out = [IO.File]::Create($head)
    try { $response.GetResponseStream().CopyTo($out) } finally { $out.Dispose() }
  }
  finally { $response.Dispose() }

  $version = [Diagnostics.FileVersionInfo]::GetVersionInfo($head).ProductVersion
  Remove-Item $head -Force
  if ($version -notmatch '^\d+(\.\d+){1,3}$') { throw "Unexpected installer version: '$version'" }

  @{
    Version = $version
    URL64   = "$cdn/XiaomiMiMo-AI-$version-x64-setup.exe"
  }
}

update -ChecksumFor 64
