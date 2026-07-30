$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/andrewyng/openworker/releases/download/v0.1.6/OpenWorker_0.1.6_x64_en-US.msi'
  checksum64     = 'a00f7f022f9f86180f4502635949594a8c93fe101e6403b08151ad30857dc83d'
  checksumType64 = 'sha256'
  softwareName   = 'OpenWorker*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
