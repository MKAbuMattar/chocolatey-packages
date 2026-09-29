$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.79.2/OpenKnowledge-Setup-x64.exe'
  checksum64     = '239f7a0606b8d0c9e72ea0b5c9d830cb244352ed148606b9e0396e8dfb2bcc0a'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
