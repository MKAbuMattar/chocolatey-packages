$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/jub0t/Concat/releases/download/v0.2.8/Concat-0.2.8-windows-x86_64.msi'
  checksum64     = 'dc24b7588ec7fe430223ccb06cb7fa54027382e4b8867557bc5515710fa3af98'
  checksumType64 = 'sha256'
  softwareName   = 'Concat*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
