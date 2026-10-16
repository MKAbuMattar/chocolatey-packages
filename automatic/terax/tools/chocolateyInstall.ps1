$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/crynta/terax-ai/releases/download/v0.9.0/Terax_0.9.0_x64_en-US.msi'
  checksum64     = '82285f06beb9564f43ca1f0de4f9ca97552fa54393409b4a78b939f2ba9c895e'
  checksumType64 = 'sha256'
  softwareName   = 'Terax*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
