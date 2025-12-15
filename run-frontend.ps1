param(
    [int]$Port = 3000
)

# Determine the repository root (script location) and target frontend folder
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$frontendPath = Join-Path $scriptDir 'frontend'

if (-Not (Test-Path $frontendPath)) {
    Write-Error "Frontend directory not found at '$frontendPath'. Run this script from the repository root."
    exit 1
}

Set-Location $frontendPath
Write-Host "Serving static files from: $frontendPath"
Write-Host "Listening on http://localhost:$Port (press Ctrl+C to stop)"

# Use Python's simple HTTP server for static hosting
python -m http.server $Port
