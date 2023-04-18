$BinariesDir = "$PSScriptRoot/bin"
$OutputDir = "../output/"
$ffmpegUnzipdir = "$BinariesDir/ffmpeg/"
$ffmpegZipname = "ffmpeg.zip"
$youtubeDLname = "$BinariesDir/yt-dlp.exe"
$AudioFormats = @("aac", "flac", "mp3", "m4a", "opus", "vorbis", "wav")
$AutoSetupFormats = @("flac", "wav", "mp4", "webm")  # Don't include mp3, as this is the base script

Write-Host $BinariesDir