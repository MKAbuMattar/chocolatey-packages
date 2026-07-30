$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/deepfakes/faceswap/releases/download/v3.0.0/faceswap_setup_x64.exe'
  checksum64     = '4366bba43c32bfc200a3763abee142e1ea90ec9c7ce3c8261e7646c10223f307'
  checksumType64 = 'sha256'
  softwareName   = 'Faceswap*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
