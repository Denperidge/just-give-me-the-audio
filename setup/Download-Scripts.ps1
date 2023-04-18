$scriptDir = "app"
$updatingSelf = "updating-self"

# If not in app directory, create and move towards it
if (!(Test-Path "Variables.ps1")) {
    New-Item -Name $scriptDir -ItemType "directory"
    Move-Item -Path @("Download-Scripts.ps1", "install.bat") -Destination $scriptDir
    Set-Location $scriptDir
} 
# If in the app directory and it has to update itself, do that
elseif ($args[1] -match $updatingSelf) {
    # If already in the app directory and not already updating self, also update self
    Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/setup/Download-Scripts.ps1" -OutFile "Download-Scripts.ps1"
    Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/setup/install.bat" -OutFile "install.bat"
    # Run new updater and exit self woops
    & .\Download-Scripts.ps1
    exit
}

Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/app/Variables.ps1" -OutFile "Variables.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/app/Download-Binaries.ps1" -OutFile "Download-Binaries.ps1"
Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/app/Download-Video.ps1" -Outfile "Download-Video.ps1"

& .\Download-Binaries.ps1 $updatingSelf
. .\Variables.ps1

Set-Location ..
Invoke-WebRequest "https://raw.githubusercontent.com/Denperidge/just-give-me-the-audio/main/mp3.bat" -OutFile "mp3.bat"


foreach ($format in $AutoSetupFormats) {
    Copy-Item -Path "mp3.bat" -Destination "$format.bat"
}