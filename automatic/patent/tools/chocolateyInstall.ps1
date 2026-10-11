$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://github.com/r14dd/patent/releases/download/v0.14.1/patent-x86_64-pc-windows-msvc.zip'
  checksum64     = '0093c71ed9b972ba9069256c920298b402107e79f5ad5f3782bfd0badd163c1f'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
