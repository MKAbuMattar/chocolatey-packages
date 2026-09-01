$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/andrewyng/openworker/releases/download/v0.2.1/OpenWorker_0.2.1_x64_en-US.msi'
  checksum64     = 'd925e39280c78dc9b0aa64545e51aadaeb341b3db6199a7401372494369691ee'
  checksumType64 = 'sha256'
  softwareName   = 'OpenWorker*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
