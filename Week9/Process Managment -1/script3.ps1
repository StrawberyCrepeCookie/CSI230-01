#  Write a PowerShell script that lists every stopped service, orders it alphabetically, and saves it to a csv file

Get-Service | where { $_.Status -eq "stopped" } | where { $_.Name -ilike "[a-z]*" } | Sort-Object `
| Export-Csv -Path "C:\Users\champuser\CSI230-01\Week9\Process Managment -1\myProcesses.csv" -NoTypeInformation