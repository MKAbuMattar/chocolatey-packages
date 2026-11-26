$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://bionic-installers.lmstudio.ai/win32/x64/1.2.3-7/Bionic-1.2.3-7-x64.exe'
  checksum64     = '6a31e1f48ef28fbe021e4fa52ee35a7416cb3efa335f01e5ef58374822d11ec3'
  checksumType64 = 'sha256'
  softwareName   = 'Bionic*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
