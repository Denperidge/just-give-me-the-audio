. .\Variables.ps1

if (!(Test-Path $OutputDir)) {
    New-Item -Name $OutputDir -ItemType "directory"
}

if (!(Test-Path $BinariesDir)) {
    New-Item -Name $BinariesDir -ItemType "directory"
}

if (!(Test-Path $youtubeDLname)) {
    Invoke-WebRequest "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" -Outfile $youtubeDLname
}

if (!(Test-Path "$BinariesDir/ffmpeg.exe")) {
    Invoke-WebRequest "https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl-shared.zip" -Outfile $ffmpegZipname
    Expand-Archive -Path $ffmpegZipname -DestinationPath $ffmpegUnzipdir
    
    Get-ChildItem $ffmpegUnzipdir -Recurse "*.exe" | Move-Item -Destination $BinariesDir

    Remove-Item $ffmpegZipname
    Remove-Item -Recurse $ffmpegUnzipdir
}

