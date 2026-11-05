$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/jub0t/Concat/releases/download/v0.2.9/Concat-0.2.9-windows-x86_64.msi'
  checksum64     = '6c6db4110bc351662fb032c1a0ede9ab88e960e41fd025c0adb0ccd7a27443fc'
  checksumType64 = 'sha256'
  softwareName   = 'Concat*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
