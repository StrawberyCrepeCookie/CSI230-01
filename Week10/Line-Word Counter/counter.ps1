cls

$directory = cd "C:\users\champuser\CSI230-01"

$FilesToLookAt = Get-ChildItem -Recurse -Filter $directory

foreach ($file in $FilesToLookAt) {
    if ($file.PSIsContainer -eq $false) {
        Get-Content $file.FullName | Measure-Object -Line -Word
        
    }
}