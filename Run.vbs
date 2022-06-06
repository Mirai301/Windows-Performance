Dim command
Set command = CreateObject("WScript.Shell")
command.Run "powershell -ep bypass -C .\Performance.ps1", 1, true