$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/jub0t/concat/releases/download/v0.2.6/Concat-0.2.6-windows-x86_64.msi'
  checksum64     = 'ff3252f19917af86a7d5c1711e2d2fa46a837581cdd51d0c60eab0e690005c86'
  checksumType64 = 'sha256'
  softwareName   = 'Concat*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
