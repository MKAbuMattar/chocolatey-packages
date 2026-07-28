# Copy this file to update_vars.ps1 (git ignored) to run update_all.ps1 locally.

$Env:api_key          = ''          # Chocolatey community repository API key
$Env:github_api_key   = ''          # GitHub token - commits, releases, GitHub API rate limit
$Env:github_user_repo = 'MKAbuMattar/chocolatey-packages'
$Env:au_Push          = 'false'     # 'true' to push updated packages to Chocolatey
