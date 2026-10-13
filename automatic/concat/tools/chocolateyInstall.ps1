$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/jub0t/concat/releases/download/v0.2.7/Concat-0.2.7-windows-x86_64.msi'
  checksum64     = '3f9edbecc9191503ce9ced58f5b2b603e462b256fa4e27fef9ee746083d84cc2'
  checksumType64 = 'sha256'
  softwareName   = 'Concat*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
