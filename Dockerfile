FROM mcr.microsoft.com/windows/nanoserver

COPY sha512.ps1 .

ENTRYPOINT ["powershell.exe", "/sha512.ps1"]
