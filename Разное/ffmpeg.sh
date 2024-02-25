#!/bin/bash

mkdir 1
for f in *.mp4 *.mkv *.mpg *.mov *.flv;
do
ffmpeg -i "$f" -vcodec h264 -acodec aac 1/"${f%.*}".mp4
done

######

for f in *.mp4;
do
ffmpeg -i "$f" -hide_banner
done
