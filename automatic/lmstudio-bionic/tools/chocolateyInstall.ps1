$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://bionic-installers.lmstudio.ai/win32/x64/1.1.7-7/Bionic-1.1.7-7-x64.exe'
  checksum64     = 'b3a19592a73c39aadb51afea7b9e46b8fe72fb893283c86cc61039fc8e1ce4c2'
  checksumType64 = 'sha256'
  softwareName   = 'Bionic*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
