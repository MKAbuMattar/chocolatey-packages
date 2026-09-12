$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/Zackriya-Solutions/meetily/releases/download/v0.4.1/meetily_0.4.1_x64_en-US.msi'
  checksum64     = 'fe31ec9fb247821de411e95635c43a3399354dd8a2ce9263460412b021a4d72b'
  checksumType64 = 'sha256'
  softwareName   = 'meetily*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
