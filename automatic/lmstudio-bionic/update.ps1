import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

# LM Studio serves a redirect to the current installer, so the version and the URL both
# come from upstream rather than being assembled here. The sibling lmstudio package
# scrapes the download page and rebuilds the URL by hand, which is how it once shipped a
# 404 and failed verification. This endpoint cannot produce a URL upstream is not serving.
$latestUrl = 'https://lmstudio.ai/download/bionic/latest/win32/x64'

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

  # .../win32/x64/1.1.2-11/Bionic-1.1.2-11-x64.exe, a version and a build number.
  if ($url -notmatch '/win32/x64/([\d.]+)-(\d+)/') {
    throw "Unexpected Bionic download URL: $url"
  }

  # The package version ignores the build number, matching how lmstudio is versioned
  # here. A build-only respin can ship through Chocolatey fix notation instead.
  @{
    Version = $Matches[1]
    URL64   = $url
  }
}

update -ChecksumFor 64
