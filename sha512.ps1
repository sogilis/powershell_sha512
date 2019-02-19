$File = $Args[0]
$NbIter = 100
$Output = "c:\data\output"

New-Item -ItemType directory -Force -Path $Output
Get-FileHash $File -Algorithm SHA512 | Out-File -FilePath "$($Output)\sha512.txt"
Measure-Command { 1..$NbIter | % { Get-FileHash $File -Algorithm SHA512 }} | Out-File -FilePath "$($Output)\time.txt"
