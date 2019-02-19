$Folder = $Args[0]
$NbIter = $Args[1]
$FoundFile = Get-ChildItem -Path $Folder | Select-Object -First 1
$File = "$Folder\$FoundFile"
$Output = "c:\data\output"

Write-Output "Parameters $Folder, $File, $NbIter, $Output"
New-Item -ItemType directory -Force -Path $Output

Write-Output "Computing SHA512"
Get-FileHash $File -Algorithm SHA512

[Console]::Out.Flush()

Write-Output "Looping $NbIter x SHA512"
Measure-Command { 1..$NbIter | % { Get-FileHash $File -Algorithm SHA512 }} | Out-File -FilePath "$($Output)\time.txt"
Write-Output "Looping Done"
