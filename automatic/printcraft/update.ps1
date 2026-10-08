import-module Chocolatey-AU
Import-Module (Join-Path $PSScriptRoot '../../au_shared.psm1') -Global

$repo = 'storytold/pdfcraft'

function global:au_SearchReplace { Get-AuSearchReplace }

function global:au_GetLatest {
  # The release also carries x86 and arm64 MSIs and portable zips; this matches only
  # the x64 MSI.
  # Upstream renamed PrintCraft to PdfCraft at 0.4.0: the repository, the files and the
  # MSI's ProductName, which softwareName has to follow. The package keeps its id.
  Get-GitHubLatest -Repo $repo -AssetPattern 'pdfcraft-*-windows-x64.msi'
}

update -ChecksumFor 64
