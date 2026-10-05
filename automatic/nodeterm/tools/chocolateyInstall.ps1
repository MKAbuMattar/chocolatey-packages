$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/eneskirca/nodeterm/releases/download/v0.4.2/nodeterm-Setup-0.4.2.exe'
  checksum64     = 'bd9ad7eac367ade2d33bef8e18be7cded09ab0fd5cb86dbbd7cba969ea8dee17'
  checksumType64 = 'sha256'
  softwareName   = 'NodeTerm*'
  silentArgs     = '/S'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
