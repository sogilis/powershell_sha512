FROM microsoft/windowsservercore

COPY sha512.ps1 .

ENTRYPOINT ["powershell.exe", "/sha512.ps1"]
