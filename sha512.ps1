$File = $Args[0]
$NbIter = $Args[1]
$Output = "c:\data\output"

Write-Output $File, $NbIter, $Output

New-Item -ItemType directory -Force -Path $Output
Get-FileHash $File -Algorithm SHA512 | Out-File -FilePath "$($Output)\sha512.txt"
[Console]::Out.Flush()
Measure-Command { 1..$NbIter | % { Write-Output "Iter $_" && Get-FileHash $File -Algorithm SHA512 }} | Out-File -FilePath "$($Output)\time.txt"
