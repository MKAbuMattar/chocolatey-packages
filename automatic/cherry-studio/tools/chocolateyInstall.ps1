$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/CherryHQ/cherry-studio/releases/download/v2.1.6/Cherry-Studio-2.1.6-win-x64-setup.exe'
  checksum64     = 'df4044957018444bae592f1e22944c98bbfc7ef5e5ce8c5c66793f774236d872'
  checksumType64 = 'sha256'
  softwareName   = 'Cherry Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
