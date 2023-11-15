clear

# List all the apache logs of xampp
#Get-Content C:\xampp\apache\logs\access.log

# List only last 5 apache logs of xampp
#Get-Content C:\xampp\apache\logs\access.log | Select-Object -Last 5

# Display only logs that contain 404 or 400 requests
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 '

# Display only logs that do NOT contain 200 requests 
$B = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch
#$B
# From every .log file in the directory, only get logs that contain the word 'error'
#$A = Get-Content C:\xampp\apache\logs\*.log | Select-String 'error'
#Display the last 5 elements of the array
#$A | select -Last 5

# Display only IP address from the query in #6
#$regex = [regex]"\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"

# B was assigned in #6
#$ips = $regex.Matches($B) | select @{Name="IP";Expression={$_.value}}
#$ips

# Count $ips from num 8
#$counts = $ips | Group -Property "IP" -NoElement
#$counts

# Add a colum, if the count is greater than 3, it will be abnormal, otherwise normal
#$countsDetailed = $counts | Select count, name, @{Name="Decision"; Expression={if($_.Count -gt 3){"Abnormal"} else {"Normal"}}}
#$countsDetailed

# Block IPs for which the Detail column is "Abnormal"
<#
foreach($ip in $countsDetailed){
    if([string]$ip.Decision -eq "Abnormal") {
        Write-Host "Blocking $ip.Name"
        New-NetFirewallRule -DisplayName "Bad IPs $ip.Name" -Direction Inbound -Action Block `
         -RemoteAddress $ip.Name
    }
}
#>

#Remove created firewall rules for bad IPS
Remove-NetFirewallRule -DisplayName "Bad IPs*"