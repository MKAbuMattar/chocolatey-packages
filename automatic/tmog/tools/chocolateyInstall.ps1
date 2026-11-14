$ErrorActionPreference = 'Stop'

# Inno Setup. /ALLUSERS makes the per-machine install explicit; the installer also
# offers a per-user one, which it names "Task Manager TMOG (Current user)".
$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64          = 'https://tmog.org/downloads/TMOG-Task-Manager-Setup-1.1.1-0-x64-cff04508eeb0.exe'
  checksum64     = 'cff04508eeb081b4d952e4adf348b35612baa93d538c59f857b812ca6a4f5e8f'
  checksumType64 = 'sha256'
  softwareName   = 'Task Manager TMOG*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
