$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/kortix-ai/CompanyOS/releases/download/v0.16.2/Kortix-Setup-0.16.2.exe'
  checksum64     = '83396f16507a337fb7d9235582d495ec24bb6ebcb654a57d7f8ae3130ec2990e'
  checksumType64 = 'sha256'
  softwareName   = 'Kortix*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
