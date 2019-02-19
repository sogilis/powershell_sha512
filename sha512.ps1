$File = $Args[0]
$NbIter = $Args[1]
$Output = "c:\data\output"

Write-Output "Parameters $File, $NbIter, $Output"
New-Item -ItemType directory -Force -Path $Output

Write-Output "Computing SHA512"
Get-FileHash $File -Algorithm SHA512 | Write-Output
Get-FileHash $File -Algorithm SHA512 | Out-File -FilePath "$($Output)\sha512.txt"

[Console]::Out.Flush()

Write-Output "Looping $NbIter x SHA512"
Measure-Command { 1..$NbIter | % { Get-FileHash $File -Algorithm SHA512 }}
Write-Output "Looping Done"
