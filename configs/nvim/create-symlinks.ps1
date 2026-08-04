. ../../PowerShell/helpers.ps1

$nvimConfigDir = Join-Path $env:LOCALAPPDATA "nvim"

if (-not (Test-Path $nvimConfigDir)) {
    New-Item -ItemType Directory -Path $nvimConfigDir | Out-Null
}

$configFiles = @(
    "lsp",
    "lua",
    "init.lua"
    "lazy-lock.json"
)

foreach ($configFile in $configFiles) {
    $symlinkFilePath = Join-Path $nvimConfigDir $configFile
    $configFilePath = (Resolve-Path $configFile -ErrorAction Stop).Path

    New-SymLink $symlinkFilePath $configFilePath
}
