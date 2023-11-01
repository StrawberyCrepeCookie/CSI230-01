cls

# Declare the array and all services

Get-Service
cls
# Function gets called recursivly to simulate loop
function do_loop() {

$array = @('all','stopped','running')

    $choice = read-host -Prompt "
    What would you like to do?
    1. View all
    2. View stopped
    3. View running
    4. Quit

    Enter"



    if ($choice -ilike 1) {
      Get-Service | select name, status
    } elseif ($choice -ilike 2) { 
      Get-Service | where { $_.Status -eq $array[1] } | select name, status
    } elseif ($choice -ilike 3) { 
      Get-Service | select name, status| where { $_.Status -eq $array[2] } | select name, status
    } elseif ($choice -ilike 4) { 
      break
    } else {
      write-host "Error, invalid input"
    }

    do_loop
}

do_loop