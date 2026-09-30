$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/andrewyng/openworker/releases/download/v0.3.0/OpenWorker_0.3.0_x64_en-US.msi'
  checksum64     = '414a21e70f19194e00b41de47d4884abcde85b9f55fc07b37f0313a5e6c9e95a'
  checksumType64 = 'sha256'
  softwareName   = 'OpenWorker*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
