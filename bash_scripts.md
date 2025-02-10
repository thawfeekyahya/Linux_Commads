# Find and replace

```
find -name "*.qml" | xargs sed -i  '/\\ingroup/ i \\\class'

find -name "*.qml" | xargs sed -i  '22,30 s/\/\*!/& \n\\class/'

find -name "*.qml" | xargs sed -i  '22,30  s/\/\*!/& \n\\class/'

find -name "*.qml"  | while read file; do filename=$(basename $file); name=`echo $filename | cut -d '.' -f1` ; sed -i "30,40 s|class|& $name|" $file ; done


testname=`echo $name | cut -d '.' -f1`

```

# Find the file rename with a different extension

```
find . -type f -name "*.qrc" -exec bash -c 'mv "$0" "${0}.bak"' {} \;

```

# Find filename with the name "config" and replace the link
// {} placeholder for find files
// _+ end terminates list of arguments // required by -exec

```
find -name config -exec sed -i 's/sedcagse0170.emea.bg.corpintra.net/gerrit.swf.cloud.corpintra.net/g' {} +
```

# Find line number and insert in the beginning

```

@i -> In place edit
@e -> script
@^ -> line start
@142 -> line number

sed -i -e '142s/^/#/ input.file
```

# Search and Comment line
```
grep -rl --include=\*.{qml,txt}  . -e "positionViewAtIndex" | xargs sed -i  -e '/positionViewAtIndex/ s/^/\/\//g' 
```


# Video Conversions
```
ffmpeg -f s16le -ar 16k -ac 1 -i userUtterance.raw file.wav

ffmpeg -i input.ogv \
   -c:v libx264 -preset veryslow -crf 22 \
   output.mp4

```

# Niceness // Priority scheduling
```
nice -n 5 /bin/executable_name
```

