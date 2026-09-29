BeforeAll {
  . (Join-Path $PSScriptRoot '..' 'publish_missing.ps1')

  # Invoke-WebRequest throws on a non-success status; the script reads the code off
  # the exception's response, so the fake has to carry one the same way.
  function New-HttpError {
    param([int]$Status)
    $response = [pscustomobject]@{ StatusCode = [pscustomobject]@{ value__ = $Status } }
    $exception = [System.Exception]::new("HTTP $Status")
    $exception | Add-Member -NotePropertyName Response -NotePropertyValue $response
    throw $exception
  }
}

Describe 'ConvertTo-NuGetVersion' {
  # The package page only answers at the normalised form. Asking for 0.8-b1 returns
  # 404 while data-formulator is published as 0.8.0-b1, so a wrong normalisation
  # would push a package that is already there.
  It 'normalises <In> to <Out>' -ForEach @(
    @{ In = '0.8-b1'; Out = '0.8.0-b1' }
    @{ In = '1.0'; Out = '1.0.0' }
    @{ In = '1.2.3.0'; Out = '1.2.3' }
    @{ In = '18.4.3'; Out = '18.4.3' }
    @{ In = '2026.9.29.1'; Out = '2026.9.29.1' }
    @{ In = '3.3.0.1'; Out = '3.3.0.1' }
    @{ In = '2026.09.29'; Out = '2026.9.29' }
    @{ In = '0.5.23-alpha'; Out = '0.5.23-alpha' }
  ) {
    ConvertTo-NuGetVersion $In | Should -Be $Out
  }
}

Describe 'Test-GalleryVersion' {
  # Each source misses one state, which is why a version is only missing when both
  # say 404. These are the three states the gallery actually showed.
  BeforeEach { Mock Start-Sleep {} }

  It 'finds a submitted version the API knows but whose page does not exist yet' {
    # kytyps5 right after its first push
    Mock Invoke-WebRequest { 'ok' } -ParameterFilter { $Uri -like '*api/v2*' }
    Mock Invoke-WebRequest { New-HttpError 404 } -ParameterFilter { $Uri -like '*/packages/*' }
    Test-GalleryVersion -Id 'kytyps5' -Version '2026.9.29' | Should -BeTrue
  }

  It 'finds a rejected version the API hides but the page still shows' {
    # faceswap 3.0.0: pushing it again would only return 409
    Mock Invoke-WebRequest { New-HttpError 404 } -ParameterFilter { $Uri -like '*api/v2*' }
    Mock Invoke-WebRequest { 'ok' } -ParameterFilter { $Uri -like '*/packages/*' }
    Test-GalleryVersion -Id 'faceswap' -Version '3.0.0' | Should -BeTrue
  }

  It 'reports a version neither source knows as missing' {
    Mock Invoke-WebRequest { New-HttpError 404 }
    Test-GalleryVersion -Id 'deepchat' -Version '1.1.2' | Should -BeFalse
  }

  It 'asks both sources for the normalised version' {
    Mock Invoke-WebRequest { New-HttpError 404 }
    Test-GalleryVersion -Id 'data-formulator' -Version '0.8-b1' | Out-Null
    Should -Invoke Invoke-WebRequest -ParameterFilter {
      $Uri -eq "https://community.chocolatey.org/api/v2/Packages(Id='data-formulator',Version='0.8.0-b1')"
    }
    Should -Invoke Invoke-WebRequest -ParameterFilter {
      $Uri -eq 'https://community.chocolatey.org/packages/data-formulator/0.8.0-b1'
    }
  }

  It 'returns null rather than guessing when the gallery keeps failing' {
    Mock Invoke-WebRequest { New-HttpError 503 }
    $state = Test-GalleryVersion -Id 'oh-my-pi' -Version '18.4.3'
    $null -eq $state | Should -BeTrue
    Should -Invoke Invoke-WebRequest -Times 3 -Exactly
  }
}

Describe 'Get-PushOutcome' {
  It 'reads <Text> as <Outcome>' -ForEach @(
    @{ Text = 'Response status code does not indicate success: 403 (Forbidden).'; Outcome = 'queue-cap' }
    @{ Text = 'Response status code does not indicate success: 409 (Conflict).'; Outcome = 'reserved' }
    @{ Text = 'packed but produced 0 nupkg files'; Outcome = 'failed' }
  ) {
    Get-PushOutcome $Text | Should -Be $Outcome
  }
}
