$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/pingdotgg/t3code/releases/download/v0.1.12/T3-Code-0.1.12-x64.exe'
  checksum64     = 'de16cc1dde8de5af5cbd1613f8e3d5f28ce8c6c402fd27ea8de82aa1df8d6bcc'
  checksumType64 = 'sha256'
  softwareName   = 'T3 Code*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
