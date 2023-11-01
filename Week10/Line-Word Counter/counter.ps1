cls

$directory = cd "C:\users\champuser\CSI230-01"

$FilesToLookAt = Get-ChildItem -Recurse -Filter $directory

for ($i = 0; $i -lt $FilesToLookAt.Length; $i++) {
    Get-Content $FilesToLookAt.Length | Measure-Object lines, words
}