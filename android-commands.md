## Filter logs
	adb logcat AndroidRuntime:I com.luxoft.carbon:I *:S ApplicationManager:I
## Screen Mirror
	adb shell screenrecord --ouput-format=h264 - | ffplay -
	adb shell screenrecord --bit-rate=16m --output-format=h264 --size 800x600 - | ffplay -framerate 60 -framedrop -bufsize 16M -

