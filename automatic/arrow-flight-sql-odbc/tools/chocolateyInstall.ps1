$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = 'https://github.com/apache/arrow/releases/download/apache-arrow-25.0.1/Apache-Arrow-Flight-SQL-ODBC-25.0.1-win64.msi'
  checksum64     = '27f761673abd12c28d304233f569b90f42e7a4e41fee5ec224c8eef04e419f15'
  checksumType64 = 'sha256'
  softwareName   = 'Apache Arrow Flight SQL ODBC*'
  silentArgs     = '/qn /norestart'
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
