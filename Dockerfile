FROM mcr.microsoft.com/powershell:nanoserver-1809

COPY sha512.ps1 .

ENTRYPOINT ["pwsh.exe", "/sha512.ps1"]
