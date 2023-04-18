. .\Variables.ps1

$format = $args[0]  # Get format passed from bat
$Url = (Get-Clipboard).Split("&")[0]


if (!($Url -Match 'youtube') -and !($Url -Match 'youtu.be')) {
    Write-Host "No youtube URL found in clipboard."
    Write-Host "Copy a youtube URL and restart this application!"
    exit
}

if ($audioformats.Contains($format)) {
    $DownloadOpts = @("--extract-audio", "--audio-format", "$format")
} else {
    $DownloadOpts = @("--recode-video", "$format")
}

$ytdlArgs = @(
    "--format", "bestvideo+bestaudio",
    "--audio-quality", "0",
    "--output", "$OutputDir/%(title)s.%(ext)s",
    "--ffmpeg-location", "$PSScriptRoot/$BinariesDir/"
    )
$ytdlArgs = $ytdlArgs + $DownloadOpts

& $youtubeDLname $ytdlArgs $Url

Invoke-Item $OutputDir