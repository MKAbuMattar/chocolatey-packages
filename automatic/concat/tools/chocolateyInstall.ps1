$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/jub0t/Concat/releases/download/v0.2.4/Concat-0.2.4-windows-x86_64.msi'
  checksum64     = '19ee792587e438b1e747b0d95fac44e377df57565d6d580ddef33b8672710bfa'
  checksumType64 = 'sha256'
  softwareName   = 'Concat*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
