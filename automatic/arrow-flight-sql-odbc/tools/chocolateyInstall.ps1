$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/apache/arrow/releases/download/apache-arrow-26.0.0/Apache-Arrow-Flight-SQL-ODBC-26.0.0-win64.msi'
  checksum64     = '3f89ccf8aa7f4ce540815864fddb62cc500952dbf6feaf8976807e1014279e12'
  checksumType64 = 'sha256'
  softwareName   = 'Apache Arrow Flight SQL ODBC*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
