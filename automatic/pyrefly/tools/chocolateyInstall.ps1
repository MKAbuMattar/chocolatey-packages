$ErrorActionPreference = 'Stop'

# The zip holds only pyrefly.exe, which choco shims onto PATH.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/pyrefly-org/pyrefly/releases/download/1.5.0/pyrefly-windows-x86_64.zip'
  checksum64     = 'c1dcc29d7b47eb9c2c251d2e1f0e7fbb7116c1e7e238b85db94c588b819db306'
  checksumType64 = 'sha256'
  unzipLocation  = Split-Path -Parent $MyInvocation.MyCommand.Definition
}

Install-ChocolateyZipPackage @packageArgs
