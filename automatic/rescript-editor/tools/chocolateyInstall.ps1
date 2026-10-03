$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/wassgha/rescript/releases/download/v1.2.3/Rescript-Setup.exe'
  checksum64     = 'ee7bf98fd88bbf557f7f96432a8ebbf7150697ff8d14da07cc24d19b91171410'
  checksumType64 = 'sha256'
  softwareName   = 'Rescript*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
