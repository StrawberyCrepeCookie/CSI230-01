# Write a PowerShell script that lists every process for which the path does not include the string "system32"

ps | where { $_.Path -ilike "C:\Program Files*" } | select ProcessName, Path