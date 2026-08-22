$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/openfootmanager/openfootmanager/releases/download/v0.2.0/Openfoot.Manager_0.2.0_x64_en-US.msi'
  checksum64     = '9446f2b63c7b652ceaec120d63b5d0ac4b607184ba3d76a883660980232ab9f2'
  checksumType64 = 'sha256'
  softwareName   = 'Openfoot Manager*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
