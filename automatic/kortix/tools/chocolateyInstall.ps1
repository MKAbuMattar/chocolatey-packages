$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/CompanyOS/releases/download/v0.15.2/Kortix-Setup-0.15.2.exe'
  checksum64     = 'df5c30cbb9e69241aea59bfafc72b5c5f1746a0fb5af1d8786dc5593a9fa8ef6'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
