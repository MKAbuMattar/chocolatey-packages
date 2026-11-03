$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/apache/arrow/releases/download/apache-arrow-26.0.1/Apache-Arrow-Flight-SQL-ODBC-26.0.1-win64.msi'
  checksum64     = '88483faaff08c563fe8f5343930683e8f178dfd486a68a8d78b9a10a6d108125'
  checksumType64 = 'sha256'
  softwareName   = 'Apache Arrow Flight SQL ODBC*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
