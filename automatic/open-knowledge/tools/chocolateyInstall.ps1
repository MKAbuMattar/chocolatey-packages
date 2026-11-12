$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.89.5/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'e60ac95aed35b1be1f4a7cbd39c1461fe2222d0c2fbe2ea12cd0259bfc50ce17'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
