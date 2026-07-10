$processName = "xmrig"
$scriptPath = "C:\xmrig\xmrig-6.26.0\xmrig.exe"

while ($true) {

    if (-not (Get-Process -Name $processName -ErrorAction SilentlyContinue)) {
        Start-Process powershell.exe `
            -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptPath`""
    }

    Start-Sleep -Seconds 3
}
