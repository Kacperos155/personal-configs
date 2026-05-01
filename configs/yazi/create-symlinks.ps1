$configFiles = @(
    "keymap.toml"
)

# Requires PowerShell 6+ (uses `Join-Path` with multiple segments via `-AdditionalChildPath`)
$yaziConfigDir = Join-Path $env:APPDATA "yazi" "config"

if (-not (Test-Path $yaziConfigDir)) {
    New-Item -ItemType Directory -Path $yaziConfigDir | Out-Null
}

foreach ($configFile in $configFiles) {
    if (-not (Test-Path $configFile)) {
        Write-Host -ForegroundColor Red "The `"$configFile`" does not exist!"
        continue
    }

    $configFilePath = (Resolve-Path $configFile).Path
    $symlinkFilePath = Join-Path $yaziConfigDir $configFile

    $symlink = New-Item -ItemType SymbolicLink -Path $symlinkFilePath -Target $configFilePath -ErrorAction Stop -Force
    Write-Host "Linked $($symlink.FullName) -> $($symlink.LinkTarget)" -ForegroundColor Cyan
}
