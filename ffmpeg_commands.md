### Webm to gif

ffmpeg -i input.webm -pix_fmt rgb24 output.gif

### WebM to Mp4
ffmpeg -i video.webm -c:v libx264 -preset ultrafast -b:v 2M -c:a aac -b:a 128k video.mp4


