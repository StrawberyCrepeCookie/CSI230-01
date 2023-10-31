# Write a PowerShell script that 
#     a) If an instance of it is not running already, it starts Google Chrome web browser and directs it
#        to Champlain.edu
#     b) If an instance is already running, stops it


$chrome = get-process | where { $_.ProcessName -eq "chrome" } | select id, processname, starttime

if ($chrome -ne $null) {
    write-host "Chrome processes: "
    Write-Host $chrome

    write-host "Closing"
    Stop-Process -Name "chrome"
} else {
    write-host "No instances of chrome, starting one"
    Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe"`
     -ArgumentList '--start-fullscreen "http://www.champlain.edu"'
}