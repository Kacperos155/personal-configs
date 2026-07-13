# Yazi wrapper with the ability to change the current working directory when exiting Yazi.
function y {
    $tmp = (New-TemporaryFile).FullName
    yazi.exe $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if ($cwd -and $cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container)) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

# Pretty-print CLI command help, e.g. `fzf --help | bathelp`
function bathelp {
    $input | bat --language=help --plain
}

# Ripgrep via Delta pager.
# https://dandavison.github.io/delta/grep.html
function rgd {
    rg --json @args | delta
}

# EZA - formatted grid of directories and files
function lg {
    eza --group-directories-first --icons --color --grid @args
}
# EZA - formatted list of directories and files with "Size" and "Date Modified" columns.
function ll {
    eza --group-directories-first --icons --color --long --header --no-permissions --time-style=long-iso @args
}
