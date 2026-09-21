$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/genspark-ai/genoffice/releases/download/v0.10.915/GenOfficeSetup-v0.10.915-x64.exe'
  checksum64     = '4e6941f4829217d899636ecacf66e304148de032ddb1e5b20c37b8f36f404fe5'
  checksumType64 = 'sha256'
  softwareName   = 'GenOffice*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
