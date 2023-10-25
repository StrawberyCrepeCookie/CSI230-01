# Powershell Basic Lab #1

# Part 1
write-host "#1 Get IPv4 Address from Ethernet Interface"
(Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*").IPAddress

write-host "-----------------------------------------------------------------------------------------"

write-host "#2 Get IPv4 PrefixLength from Ethernet Interface"
(Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*").PrefixLength

write-host "-----------------------------------------------------------------------------------------"

write-host "#3 Show what classes of Win32 library that starts with net"
Get-WmiObject -list | where { $_.Name -like "Win32_net*" }

write-host "-----------------------------------------------------------------------------------------"

write-host "#4 Show what classes of Win32 library that starts with net & Sort alphabetically"
Get-WmiObject -list | where { $_.Name -like "Win32_net[a-z]*" } | Sort-Object

write-host "-----------------------------------------------------------------------------------------"

write-host "#5 Get DHCP server IP"
Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer

write-host "-----------------------------------------------------------------------------------------"

write-host "#6 Get DHCP server IP & Hide the table headers"
Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer | Format-Table -HideTableHeaders 

write-host "-----------------------------------------------------------------------------------------"

write-host "#7 Get DNS server IPs and display only the first one"
(Get-DnsClientServerAddress -AddressFamily IPv4 | where InterfaceAlias -ilike "Ethernet*").ServerAddresses | Select-Object -first 1

# Part 2 - Directory Listings

write-host "-----------------------------------------------------------------------------------------"

write-host "#8 (Do this with arrays) List all the files in your working directory that has the extention .ps1"
# Choose a directory where you have some files
cd "C:\Users\champuser\CSI230-01\Week9"

# List based on the file name
$files = ls

for ($j = 0; $j -le $files.Length; $j++) {
    if ($files[$j].Extension -ilike "*ps1") {
        write-host $files[$j].Name
    }
}

write-host "-----------------------------------------------------------------------------------------"

write-host "#9 Create folder is it does not exist"
$folderPath = "C:\Users\champuser\CSI230-01\Week9\outfolder"
if (Test-Path -Path $folderPath) {
    Write-Host "Folder Already Exists"
} else {
    New-Item -ItemType Directory -Path $folderPath
}

write-host "-----------------------------------------------------------------------------------------"

write-host "#10 List all the files in your working directory that has .ps1 and save the results to out.csv file in outfolder"
cd "C:\Users\champuser\CSI230-01\Week9"
$files = ls

ls | where { $_.Extension.Equals(".ps1") } | Export-Csv "C:\Users\champuser\CSI230-01\Week9\outfolder\ps1Files.csv"

write-host "-----------------------------------------------------------------------------------------"

write-host "#11 Without changing the directory, find every .csv file and change their extensions to .log. Then recursively display all the files"
$files = Get-ChildItem -Recurse -file
$files | Rename-Item -NewName { $_.name -replace '.csv', '.log' }
Get-ChildItem -Recurse -file