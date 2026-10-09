$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/eneskirca/nodeterm/releases/download/v0.4.3/nodeterm-Setup-0.4.3.exe'
  checksum64     = 'bab61c3ae6fa3757868668927b14b1cb05d1b26f934887aa9ee3a9b11772aab5'
  checksumType64 = 'sha256'
  softwareName   = 'NodeTerm*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
