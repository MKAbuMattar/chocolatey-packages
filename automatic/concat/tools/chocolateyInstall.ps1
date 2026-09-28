$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/jub0t/Concat/releases/download/v0.2.5/Concat-0.2.5-windows-x86_64.msi'
  checksum64     = '5ff1186a12f55fbc2b8287e2e15d8552d8b9be4c19e3b7964bf98326da7fb842'
  checksumType64 = 'sha256'
  softwareName   = 'Concat*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
