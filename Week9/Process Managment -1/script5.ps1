# Write a PowerShell script that lists every file whose creation date is greater than 10/24/2023 
# (you might need to reformat this date), saves file names and creation dates (only these two) 
# to a csv file without the headers (No info headers on the csv file. We have examples in slides)

cd "C:\Users\champuser\CSI230-01\Week9\Process Managment -1"
$files = ls

ls | where { $_.CreationTime -gt "10/24/2023" } | select name, creationtime |`
Export-Csv -Path "C:\Users\champuser\CSI230-01\Week9\Process Managment -1\myProcesses2.csv" -NoTypeInformation