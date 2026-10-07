# AnyPS5 Chocolatey Package

## What is AnyPS5?

AnyPS5 converts PS5 executables into native Windows and Linux programs. Its relinker
rewrites an executable into the target system's own format, and it ships
implementations of the PS5 system libraries for the converted program to link against.
There is no emulator and no separate runtime process.

AnyPS5 does not provide games. Use only executables you have obtained legally.

## Usage

The package installs the `relinker` command, and the matching Windows system libraries
in `C:\ProgramData\chocolatey\lib\anyps5\tools\prx-windows\libs`. Convert an executable
with `relinker --windows source\input.elf app.exe`, then copy that `libs` folder next to
`app.exe`. See the [usage guide](https://github.com/boykopovar/AnyPS5/blob/main/docs/user/USAGE.md)
for the input layout and options.
