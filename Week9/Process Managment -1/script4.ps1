# Write a PowerShell script that lists every file with .ps1 extension, and sorts them by CreationTime (only .ps1 files)

cd "C:\Users\champuser\CSI230-01\Week9\Process Managment -1"
$files = ls

ls | where { $_.Extension.Equals(".ps1") } | Sort CreationTime -Descending | select CreationTime, Name