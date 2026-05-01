# Get timestamp of the latest boot on this machine.
function Get-LastBoot {
    $lastBoot = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime

    [PSCustomObject]@{
        LastBootUpTime      = $lastBoot
        SinceLastBootUpTime = (Get-Date) - $lastBoot
    }
}

# Show formatted info about the time passed since the latest boot on this machine.
function Show-LastBoot {
    $lastBoot = Get-LastBoot
    $sinceBoot = $lastBoot.SinceLastBootUpTime

    Write-Host -NoNewline "Last boot: "
    Write-Host -NoNewline -ForegroundColor DarkYellow $lastBoot.LastBootUpTime
    Write-Host -NoNewline " "

    if ($sinceBoot.Days -gt 0) {
        Write-Host -ForegroundColor DarkRed (
            "(+{0} days {1}h {2}min)" -f $sinceBoot.Days, $sinceBoot.Hours, $sinceBoot.Minutes
        )
    }
    else {
        Write-Host -ForegroundColor DarkRed (
            "(+{0}h {1}min)" -f $sinceBoot.Hours, $sinceBoot.Minutes
        )
    }
}
