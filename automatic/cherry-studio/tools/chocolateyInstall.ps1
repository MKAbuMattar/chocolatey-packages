$ErrorActionPreference = 'Stop'

# An NSIS installer, so /S; softwareName matches the product name it registers.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/CherryHQ/cherry-studio/releases/download/v2.2.1/Cherry-Studio-2.2.1-win-x64-setup.exe'
  checksum64     = '365db7bbb4be5117ee6869f718fa92c8d9d0fd8f4918ed3e5e9c92f1da638601'
  checksumType64 = 'sha256'
  softwareName   = 'Cherry Studio*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
