. ../../PowerShell/helpers.ps1

# Requires PowerShell 6+ (uses `Join-Path` with multiple segments via `-AdditionalChildPath`)
$yaziConfigDir = Join-Path $env:APPDATA "yazi" "config"

if (-not (Test-Path $yaziConfigDir)) {
    New-Item -ItemType Directory -Path $yaziConfigDir | Out-Null
}

$configFiles = @(
    "init.lua"
    "keymap.toml"
    "theme.toml"
    "yazi.toml"
)

foreach ($configFile in $configFiles) {
    $symlinkFilePath = Join-Path $yaziConfigDir $configFile
    $configFilePath = (Resolve-Path $configFile -ErrorAction Stop).Path

    New-SymLink $symlinkFilePath $configFilePath
}
