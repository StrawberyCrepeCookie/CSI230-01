cls

[bool] $loop = $true
$array = @('all','stopped','running')

$allServices = Get-Service | select name, status

function opt_1() {
    $allServices 
}

function opt2() {
    $allServices | where { $_.Status -eq $array[1] } 
}

function opt3() {
    $allServices | where { $_.Status -eq $array[2] }
    }
function opt4() {
    write-host "Exiting... "
}

function do_loop() {

    write-host "What would you like to do?"
    write-host "1. View all"
    write-host "2. View stopped"
    write-host "3. View running"
    write-host "4. Quit"

    $choice = read-host -Prompt "Enter: "

    Write-Host "You have chosen: "
    $choice

    if ($choice -eq 1) {
      write-host "opt_1" 
      opt_1
      do_loop
    } elseif ($choice -eq 2) { 
      write-host "opt_2"
      opt2
      do_loop
    } elseif ($choice -eq 3) { 
      write-host "opt_3" 
      opt3
      do_loop
    } elseif ($choice -eq 4) { 
      write-host "4" 
      opt4
    } else {
      write-host "Error, invalid input"
      do_loop
    }
}

do_loop