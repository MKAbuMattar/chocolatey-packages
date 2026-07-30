$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/bgreenwell/xleak/releases/download/v0.2.6/xleak-x86_64-pc-windows-msvc.msi'
  checksum64     = 'de949c47d2084aa6d0abc013e3cf87886b6db57cc79f1f94b6d77cfc4bdb8ef5'
  checksumType64 = 'sha256'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
