$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/andrewyng/openworker/releases/download/v0.3.1/OpenWorker_0.3.1_x64_en-US.msi'
  checksum64     = 'f5d787db754f6a13d3a07ed12a1d04a050005659db9426d147c149710a33e1c2'
  checksumType64 = 'sha256'
  softwareName   = 'OpenWorker*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
