$ErrorActionPreference = 'Stop'

# An Inno Setup installer that defaults to a per-user install. /ALLUSERS installs it per
# machine, so Chocolatey's auto-uninstaller finds it by product name.
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://github.com/l0ng-ai/tty7/releases/download/v26.10.0/tty7-26.10.0-windows-x86_64-setup.exe'
  checksum64     = 'ab76cc9c367ba8007a90c200a970643314e2ad726aa8a47632bc1a328a48eae0'
  checksumType64 = 'sha256'
  softwareName   = 'tty7*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
