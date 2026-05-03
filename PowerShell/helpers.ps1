function New-SymLink($symlinkPath, $targetPath) {
    if (-not (Test-Path $targetPath)) {
        Write-Host -ForegroundColor Red "The `"$targetPath`" does not exist!"
        return
    }

    $symlink = New-Item -ItemType SymbolicLink -Path $symlinkPath -Target $targetPath -ErrorAction Stop -Force
    Write-Host "Linked $($symlink.FullName) -> $($symlink.LinkTarget)" -ForegroundColor Cyan
}
