$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/Kochava-Studios/witsy/releases/download/v3.5.2/Witsy-3.5.2-win32-x64.Setup.exe'
  checksum64     = 'b604bb522efeeef98b4bc9e99c1ff8ed3b0775e9f70d8ee68d5bc9917f9a3099'
  checksumType64 = 'sha256'
  softwareName   = 'Witsy*'
  silentArgs     = '/S /quiet'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
