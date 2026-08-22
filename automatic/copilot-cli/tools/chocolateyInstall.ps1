$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/github/copilot-cli/releases/download/v1.0.80/copilot-x64.msi'
  checksum64     = ''
  checksumType64 = 'sha256'
  softwareName   = 'GitHub Copilot CLI*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
