import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

# The release notes link is the product page, which does not change per version.
function global:au_SearchReplace { Get-AuSearchReplace -NoReleaseNotes }

function global:au_GetLatest {
  # xAI's download link redirects to the versioned installer on Cursor's CDN. Read the
  # redirect rather than follow it; the target's path carries the version and never
  # changes contents.
  $request = [Net.HttpWebRequest]::Create('https://api2.cursor.sh/updates/download/stable/win32-x64/grok-bot-cf55d121b6d17368')
  $request.AllowAutoRedirect = $false
  $request.Method = 'HEAD'
  $response = $request.GetResponse()
  try { $location = $response.Headers['Location'] } finally { $response.Dispose() }

  if ($location -notmatch '/win32-x64/(\d+\.\d+\.\d+)/Grok_Bot_[\d.]+_Setup\.exe$') {
    throw "Unexpected download redirect: '$location'"
  }
  @{
    Version = $Matches[1]
    URL64   = $location
  }
}

update -ChecksumFor 64
