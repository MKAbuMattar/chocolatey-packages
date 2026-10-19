$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/CherryHQ/cherry-studio/releases/download/v2.1.7/Cherry-Studio-2.1.7-win-x64-setup.exe'
  checksum64     = '3e0562ad5f588e8e3988a501549dce0d75183fb76ff3a616df1112bba11a83d1'
  checksumType64 = 'sha256'
  softwareName   = 'Cherry Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
