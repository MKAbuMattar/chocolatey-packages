$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/CherryHQ/cherry-studio/releases/download/v2.1.10/Cherry-Studio-2.1.10-win-x64-setup.exe'
  checksum64     = 'f0c56cb51f711fe3983c802acbef52f75fb3ec22820637f4760bd4d218ab82bf'
  checksumType64 = 'sha256'
  softwareName   = 'Cherry Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
