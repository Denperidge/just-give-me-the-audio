mkdir just-give-me-the-audio
cd just-give-me-the-audio
PowerShell Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/setup/Download-Scripts.ps1" -OutFile "Download-Scripts.ps1"
powershell -ExecutionPolicy ByPass "./Download-Scripts.ps1"
