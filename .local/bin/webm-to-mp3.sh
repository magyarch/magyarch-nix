#!/usr/bin/env bash

for f in *.webm; do
    ffmpeg -i "$f" -vn -ar 44100 -ac 2 -b:a 192k "${f%.webm}.mp3"
done

