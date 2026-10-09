$ErrorActionPreference = 'Stop'

# Inno Setup. /ALLUSERS makes the per-machine install explicit; the installer also
# offers a per-user one, which it names "Task Manager TMOG (Current user)".
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://tmog.org/rtm/downloads/TMOG-Task-Manager-Setup-1.0.1-0-x64-b4edf70fa040.exe'
  checksum64     = 'b4edf70fa040968958c662ffb09feeeb0eeca07759e6ed7742606bcc39f29fc6'
  checksumType64 = 'sha256'
  softwareName   = 'Task Manager TMOG*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
