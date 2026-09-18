$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/inkeep/open-knowledge/releases/download/v0.76.1/OpenKnowledge-Setup-x64.exe'
  checksum64     = 'd5567fdedf6213a8aeaa2c6959125be63c7e891dab2b82fbd36c07428c96e450'
  checksumType64 = 'sha256'
  softwareName   = 'OpenKnowledge*'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
