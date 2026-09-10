import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

# LM Studio serves a redirect to the current installer. This used to scrape
# lmstudio.ai/download instead, stitching Next.js streaming chunks back together with
# two regexes to recover the version and build number, then rebuilding the URL by hand.
# That is how 0.4.20 shipped a URL upstream was not serving and failed verification with
# a 404. The redirect returns the exact file upstream is serving, so a URL it does not
# serve cannot be produced.
$latestUrl = 'https://lmstudio.ai/download/latest/win32/x64'

# The nuspec links LM Studio's blog rather than a per-release page, so nothing in it
# changes with the version and AU has to leave it alone.
function global:au_SearchReplace { Get-AuSearchReplace -NoReleaseNotes }

function global:au_GetLatest {
  $request = [System.Net.WebRequest]::Create($latestUrl)
  $request.AllowAutoRedirect = $false
  $request.UserAgent = 'chocolatey-packages'
  $response = $request.GetResponse()
  try { $url = $response.Headers['Location'] } finally { $response.Dispose() }

  if (!$url) { throw "$latestUrl did not redirect to an installer" }

  # .../win32/x64/0.4.24-1/LM-Studio-0.4.24-1-x64.exe, a version and a build number.
  if ($url -notmatch '/win32/x64/([\d.]+)-(\d+)/') {
    throw "Unexpected LM Studio download URL: $url"
  }

  # The package version ignores the build number, matching how this package has always
  # been versioned. A build-only respin can ship through Chocolatey fix notation.
  @{
    Version = $Matches[1]
    URL64   = $url
  }
}

update -ChecksumFor 64
