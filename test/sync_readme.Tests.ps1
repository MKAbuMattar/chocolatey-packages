BeforeAll {
  $syncScript = Join-Path $TestDrive 'sync_readme.ps1'
  Copy-Item (Join-Path $PSScriptRoot '..' 'sync_readme.ps1') $syncScript

  function New-SyncPackage {
    param(
      [string]$Name,
      [string]$Readme = "# $Name Chocolatey Package`n`nNew body.",
      [string]$Nuspec = $null,
      [switch]$NoReadme,
      [switch]$NoNuspec
    )

    $dir = Join-Path $TestDrive "automatic/$Name"
    New-Item $dir -ItemType Directory -Force | Out-Null
    if (!$NoReadme) {
      Set-Content -LiteralPath (Join-Path $dir 'README.md') `
        -Value $Readme -NoNewline
    }
    if (!$NoNuspec) {
      if ([string]::IsNullOrEmpty($Nuspec)) {
        $Nuspec = @"
<package>
  <metadata>
    <id>$Name</id>
    <description><![CDATA[
old body
]]></description>
  </metadata>
</package>
"@
      }
      Set-Content -LiteralPath (Join-Path $dir "$Name.nuspec") `
        -Value $Nuspec -NoNewline
    }
    return $dir
  }

  function Invoke-Sync {
    param([switch]$Check, [string[]]$Name)
    $params = @{}
    if ($Check) { $params.Check = $true }
    if ($Name) { $params.Name = $Name }
    (& $syncScript @params) *>&1 | Out-String
  }

  function Get-FileText {
    param([string]$Path)
    [IO.File]::ReadAllText($Path)
  }
}

Describe 'sync_readme.ps1' {
  BeforeEach {
    Remove-Item (Join-Path $TestDrive 'automatic') -Recurse -Force -ErrorAction SilentlyContinue
    New-Item (Join-Path $TestDrive 'automatic') -ItemType Directory -Force | Out-Null
  }

  It 'writes the README body into the description and removes the H1' {
    $dir = New-SyncPackage -Name alpha -Readme "# Alpha Chocolatey Package`n`nLine one.`nLine two."

    $output = Invoke-Sync

    $output | Should -Match 'Synced 1 nuspec description'
    (Get-FileText (Join-Path $dir 'alpha.nuspec')) | Should -Be @"
<package>
  <metadata>
    <id>alpha</id>
    <description><![CDATA[Line one.
Line two.
]]></description>
  </metadata>
</package>
"@
  }

  It 'preserves CRLF and LF nuspec line endings' {
    $crlfNuspec = "<package>`r`n  <description><![CDATA[`r`nold`r`n]]></description>`r`n</package>`r`n"
    $lfNuspec = "<package>`n  <description><![CDATA[`nold`n]]></description>`n</package>`n"
    $crlfDir = New-SyncPackage -Name crlf -Readme "# Crlf`r`n`r`nbody" -Nuspec $crlfNuspec
    $lfDir = New-SyncPackage -Name lf -Readme "# Lf`n`nbody" -Nuspec $lfNuspec

    Invoke-Sync | Out-Null

    (Get-FileText (Join-Path $crlfDir 'crlf.nuspec')) | Should -Be "<package>`r`n  <description><![CDATA[body`r`n]]></description>`r`n</package>`r`n"
    (Get-FileText (Join-Path $lfDir 'lf.nuspec')) | Should -Be "<package>`n  <description><![CDATA[body`n]]></description>`n</package>`n"
  }

  It 'does not introduce a BOM when the nuspec has none' {
    $dir = New-SyncPackage -Name bomless
    $nuspecPath = Join-Path $dir 'bomless.nuspec'

    Invoke-Sync | Out-Null

    $bytes = [IO.File]::ReadAllBytes($nuspecPath)
    $bytes[0] | Should -Not -Be 0xEF
  }

  It 'preserves a BOM the nuspec already carries' {
    $nuspec = "<package><metadata><id>bom</id><description><![CDATA[`nold`n]]></description></metadata></package>"
    $dir = New-SyncPackage -Name bom -Nuspec $nuspec
    $nuspecPath = Join-Path $dir 'bom.nuspec'
    [IO.File]::WriteAllText($nuspecPath, $nuspec, [Text.UTF8Encoding]::new($true))

    Invoke-Sync | Out-Null

    [IO.File]::ReadAllBytes($nuspecPath)[0..2] | Should -Be 0xEF, 0xBB, 0xBF
  }

  It 'inserts regex replacement characters literally' {
    $readme = @'
# Literal Chocolatey Package

Use $1, $&, and \server\share literally.
'@
    $dir = New-SyncPackage -Name literal -Readme $readme

    Invoke-Sync | Out-Null

    $text = Get-FileText (Join-Path $dir 'literal.nuspec')
    $text | Should -Match ([regex]::Escape('Use $1, $&, and \server\share literally.'))
  }

  It 'skips a README containing a CDATA terminator' {
    $dir = New-SyncPackage -Name unsafe -Readme "# Unsafe Chocolatey Package`n`nnot ]]>"
    $before = Get-FileText (Join-Path $dir 'unsafe.nuspec')

    $output = Invoke-Sync

    $output | Should -Match "unsafe README contains ']]>'"
    (Get-FileText (Join-Path $dir 'unsafe.nuspec')) | Should -Be $before
  }

  It 'skips packages with missing files or without a CDATA description' {
    $missingReadme = New-SyncPackage -Name no-readme -NoReadme
    $missingNuspec = New-SyncPackage -Name no-nuspec -NoNuspec
    $plainNuspec = @"
<package><metadata><description>plain</description></metadata></package>
"@
    $plain = New-SyncPackage -Name plain -Nuspec $plainNuspec

    $output = Invoke-Sync

    $output | Should -Match 'no-readme is missing README.md or no-readme.nuspec'
    $output | Should -Match 'no-nuspec is missing README.md or no-nuspec.nuspec'
    $output | Should -Match 'plain nuspec has no CDATA <description>'
    (Get-FileText (Join-Path $plain 'plain.nuspec')) | Should -Be $plainNuspec
    Test-Path (Join-Path $missingReadme 'no-readme.nuspec') | Should -BeTrue
  }

  It 'replaces only the first description CDATA block' {
    $nuspec = @'
<package>
  <metadata>
    <description><![CDATA[
old first
]]></description>
    <notes><![CDATA[keep this second CDATA]]></notes>
  </metadata>
</package>
'@
    $dir = New-SyncPackage -Name first -Readme "# First Chocolatey Package`n`nnew first" -Nuspec $nuspec

    Invoke-Sync | Out-Null

    $text = Get-FileText (Join-Path $dir 'first.nuspec')
    $text | Should -Match 'new first'
    $text | Should -Match 'keep this second CDATA'
    ([regex]::Matches($text, '<!\[CDATA\[')).Count | Should -Be 2
  }

  It 'filters to the requested package names' {
    $selected = New-SyncPackage -Name selected
    $other = New-SyncPackage -Name other
    $otherBefore = Get-FileText (Join-Path $other 'other.nuspec')

    $output = Invoke-Sync -Name selected

    $output | Should -Match 'Synced 1 nuspec description'
    (Get-FileText (Join-Path $selected 'selected.nuspec')) | Should -Match 'New body'
    (Get-FileText (Join-Path $other 'other.nuspec')) | Should -Be $otherBefore
  }

  It 'reports drift without modifying files in check mode' {
    $dir = New-SyncPackage -Name drift
    $before = Get-FileText (Join-Path $dir 'drift.nuspec')

    $output = Invoke-Sync -Check

    $output | Should -Match '::error::1 nuspec description'
    (Get-FileText (Join-Path $dir 'drift.nuspec')) | Should -Be $before
  }

  It 'returns a nonzero exit code and error annotation for check drift' {
    New-SyncPackage -Name child-drift | Out-Null
    $pwsh = Join-Path $PSHOME 'pwsh'

    $output = (& $pwsh -NoProfile -File $syncScript -Check) *>&1 | Out-String

    $LASTEXITCODE | Should -Be 1
    $output | Should -Match '::error::1 nuspec description'
  }

  It 'reports success in check mode when all descriptions match' {
    $dir = New-SyncPackage -Name synced
    Invoke-Sync | Out-Null

    $output = Invoke-Sync -Check

    $output | Should -Match 'All nuspec descriptions match their README'
  }

  It 'is idempotent' {
    New-SyncPackage -Name repeat | Out-Null
    Invoke-Sync | Out-Null

    $output = Invoke-Sync

    $output | Should -Match 'already match'
  }
}
