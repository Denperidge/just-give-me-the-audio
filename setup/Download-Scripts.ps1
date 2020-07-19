$scriptDir = "app"

New-Item -Name $scriptDir -ItemType "directory"
Move-Item -Path ./* -Destination "setup" 
Set-Location $scriptDir

Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/app/Variables.ps1" -OutFile "Variables.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/app/Download-Binaries.ps1" -OutFile "Download-Binaries.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/app/Download-Video.ps1" -Outfile "Download-Video.ps1"

& .\Download-Binaries.ps1
. .\Variables.ps1

Set-Location ..
Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/mp3.bat" -OutFile "mp3.bat"


foreach ($format in $audioformats) {
    if (!$format -match "mp3") {
        Copy-Item -Path "mp3.bat" -Destination "$format.bat"
    }
}