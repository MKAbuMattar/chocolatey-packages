BeforeAll {
  # The RepeatOn and IgnoreOn lists exactly as update_all.ps1 hands them to AU.
  $ast = [Management.Automation.Language.Parser]::ParseFile(
    (Join-Path $PSScriptRoot '..' 'update_all.ps1'), [ref]$null, [ref]$null)
  function Get-OptionList {
    param([string]$Name)
    $pair = $ast.Find({
        param($node)
        $node -is [Management.Automation.Language.HashtableAst] -and
        ($node.KeyValuePairs | Where-Object { $_.Item1.Value -eq $Name })
      }, $true).KeyValuePairs | Where-Object { $_.Item1.Value -eq $Name }
    @($pair.Item2.FindAll({ param($n) $n -is [Management.Automation.Language.StringConstantExpressionAst] }, $true).Value)
  }
  $script:RepeatOn = Get-OptionList 'RepeatOn'
  $script:IgnoreOn = Get-OptionList 'IgnoreOn'

  # AU compares each entry as $_.Exception -like "*entry*", so the tests do too.

  # A real HTTP server on localhost answering every request with one status, so the
  # error text comes from .NET exactly as AU sees it when it validates a URL.
  $script:Listener = [Net.HttpListener]::new()
  $script:Port = Get-Random -Minimum 20000 -Maximum 40000
  $script:Listener.Prefixes.Add("http://localhost:$script:Port/")
  $script:Listener.Start()

  function Get-ErrorText {
    param([int]$Status)
    $wait = $script:Listener.GetContextAsync()
    $request = [Net.HttpWebRequest]::Create("http://localhost:$script:Port/$Status")
    $pending = $request.GetResponseAsync()
    $context = $wait.GetAwaiter().GetResult()
    $context.Response.StatusCode = $Status
    $context.Response.Close()
    try { $pending.GetAwaiter().GetResult().Dispose(); '' }
    catch { $_.Exception.Message }
  }
}

AfterAll { $script:Listener.Stop(); $script:Listener.Close() }

# Run 40372912259 failed 14 packages on "(504) Gateway Timeout" from GitHub's
# download servers, for URLs that answered 200 an hour later.
Describe 'AU retry lists against real HTTP errors' -Tag 'Integration' {
  It 'retries, then ignores, a <Status> response' -ForEach @(
    @{ Status = 502 }, @{ Status = 503 }, @{ Status = 504 }, @{ Status = 500 }
  ) {
    $text = Get-ErrorText -Status $Status
    $text | Should -Match "\($Status\)"
    @($script:RepeatOn | Where-Object { $text -like "*$_*" }) | Should -Not -BeNullOrEmpty
    @($script:IgnoreOn | Where-Object { $text -like "*$_*" }) | Should -Not -BeNullOrEmpty
  }

  # The update workflow runs AU under Windows PowerShell 5.1, whose .NET Framework
  # words some statuses differently: 503 is "Server Unavailable" there.
  It 'retries, then ignores, 502, 503 and 504 as Windows PowerShell 5.1 words them' -Skip:(!(Get-Command powershell.exe -ErrorAction Ignore)) {
    $code = @'
$l = New-Object Net.HttpListener; $port = Get-Random -Minimum 40001 -Maximum 50000
$l.Prefixes.Add("http://localhost:$port/"); $l.Start()
foreach ($s in 502, 503, 504) {
  $w = $l.GetContextAsync(); $p = ([Net.HttpWebRequest]::Create("http://localhost:$port/")).GetResponseAsync()
  $c = $w.GetAwaiter().GetResult(); $c.Response.StatusCode = $s; $c.Response.Close()
  try { $p.GetAwaiter().GetResult() | Out-Null } catch { $_.Exception.InnerException.Message }
}
$l.Stop()
'@
    $texts = @(powershell.exe -NoProfile -Command $code)
    $texts.Count | Should -Be 3
    foreach ($text in $texts) {
      @($script:RepeatOn | Where-Object { $text -like "*$_*" }) | Should -Not -BeNullOrEmpty -Because $text
      @($script:IgnoreOn | Where-Object { $text -like "*$_*" }) | Should -Not -BeNullOrEmpty -Because $text
    }
  }

  # A missing file must still fail the run, or a broken package would go unnoticed.
  It 'neither retries nor ignores a 404' {
    $text = Get-ErrorText -Status 404
    $text | Should -Match '\(404\)'
    @($script:RepeatOn | Where-Object { $text -like "*$_*" }) | Should -BeNullOrEmpty
    @($script:IgnoreOn | Where-Object { $text -like "*$_*" }) | Should -BeNullOrEmpty
  }
}
