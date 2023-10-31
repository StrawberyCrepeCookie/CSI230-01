# Write a PowerShell script that lists every process for which the StartTime is in the last hour (you can hard code the date and time) 
# and ProcessName starts with 'C'.
# 10/25/2023
Get-Process | where { $_.StartTime -ilike "10/28/2023 10:*" } | where { $_.Name -ilike "C*" } | select name, Starttime