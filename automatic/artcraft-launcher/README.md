# ArtCraft Launcher Chocolatey Package

## What is ArtCraft Launcher?

ArtCraft Launcher is one place to install, update and open every app in the Craft App
Suite: PhotoCraft, FilmCraft, DeckCraft, GridCraft and the rest, with the right build
for your computer, kept up to date. It is open source and written in Rust.

## Usage

The package installs ArtCraft Launcher for the account that runs choco, under
`%LOCALAPPDATA%\Programs\ArtCraft\Launcher`; its installer has no all-users mode.
Start it from the Start Menu.

Apps the launcher installs are its own and are not tracked by Chocolatey. Each Craft
app is also available as its own Chocolatey package.
