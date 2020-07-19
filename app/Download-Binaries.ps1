. .\Variables.ps1

if (!(Test-Path $OutputDir)) {
    New-Item -Name $OutputDir -ItemType "directory"
}

if (!(Test-Path $BinariesDir)) {
    New-Item -Name $BinariesDir -ItemType "directory"
}

if (!(Test-Path $youtubeDLname)) {
    Invoke-WebRequest "https://youtube-dl.org/downloads/latest/youtube-dl.exe" -Outfile $youtubeDLname
}

if (!(Test-Path $ffmpegName)) {
    Invoke-WebRequest "https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-4.3-win64-static.zip" -Outfile $ffmpegZipname
    Expand-Archive -Path $ffmpegZipname -DestinationPath $ffmpegUnzipdir
    
    Get-ChildItem $ffmpegUnzipdir -Recurse "*.exe" | Move-Item -Destination $BinariesDir

    Remove-Item $ffmpegZipname
    Remove-Item -Recurse $ffmpegUnzipdir
}

