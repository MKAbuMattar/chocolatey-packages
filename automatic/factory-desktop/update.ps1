import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

# The release notes page is one page for every version.
function global:au_SearchReplace { Get-AuSearchReplace -NoReleaseNotes }

function global:au_GetLatest {
  # Factory's download link redirects to the versioned installer. Read the redirect
  # instead of following it: the target is a 290 MB file, and its path carries the
  # version. The package installs from the versioned URL, which never changes contents.
  $request = [Net.HttpWebRequest]::Create('https://app.factory.ai/api/desktop?platform=win32&architecture=x64')
  $request.AllowAutoRedirect = $false
  $request.Method = 'HEAD'
  $response = $request.GetResponse()
  try { $location = $response.Headers['Location'] } finally { $response.Dispose() }

  if ($location -notmatch '/releases/(\d+\.\d+\.\d+)/win32/x64/[^/]+\.exe$') {
    throw "Unexpected download redirect: '$location'"
  }
  @{
    Version = $Matches[1]
    URL64   = $location
  }
}

update -ChecksumFor 64
