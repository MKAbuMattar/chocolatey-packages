$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/eneskirca/nodeterm/releases/download/v0.4.0/nodeterm-Setup-0.4.0.exe'
  checksum64     = 'f7f675030fd96e9a5ad85ddc87751dbb14b2852bb022cadfa86259113a9f7686'
  checksumType64 = 'sha256'
  softwareName   = 'NodeTerm*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
