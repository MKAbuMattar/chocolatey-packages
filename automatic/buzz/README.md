# Buzz Chocolatey Package

## What is Buzz?

A hive mind communication platform.

## Prerelease and unsigned

The only Windows build upstream publishes is named `Buzz_<version>_x64-setup_alpha-unsigned.exe`,
and has been for every desktop release. Two things follow from that.

It is an alpha. Upstream has not called a Windows build stable, so treat it as
unfinished software.

It is unsigned. Windows SmartScreen will warn on it, and the installer carries no
Authenticode signature to check the publisher against. The package verifies the download
against a SHA256 checksum recorded in the install script, which confirms the file is the
one upstream published and says nothing about who wrote it.
