﻿clear

cd C:\Users\champuser\Desktop\

Get-Eventlog -list

$readLog = read-host -Prompt "Please select a log to review"

Get-EventLog -LogName $readLog -Newest 3 | export-csv -NoTypeInformation -Path "C:\Users\champuser\Desktop\rep.csv"