$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/wassgha/rescript/releases/download/v1.2.1/Rescript-Setup.exe'
  checksum64     = '6c78e2138b2d1c4f2bfa28bfacd3879aca09e2ba6287156b87e83f5f2e22209b'
  checksumType64 = 'sha256'
  softwareName   = 'Rescript*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
