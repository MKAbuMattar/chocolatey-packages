$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.78.0/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'e1258988bab6bc87bc9de75e5823f9dcebe673dd8a7eaa3b91feb4e048130be1'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
