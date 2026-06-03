# Simple tutorial

# Convert different image format
ffmpeg -i xx.jpg xx.png

# convert x to y
ffmpeg -i xx.mp3 xx.aac

# Remove audio or video
ffmpeg -i xxx.mkv -vn  audio.ogg
ffmpeg -i xxx.mkv -an video.mkv

# Change container
ffmpeg -i xxx.mkv -c:v copy -c:a copy output.mp4

# X11 grab / screen record
ffmpeg -y \
	-f x11grab \
	-framerate 60 \
	-s $(xdpyinfo | grep dimensions | awk '{print $2;}') \
	-i $DISPLAY \
	-f alsa -i default \
	-r 30 \
 	-c:v libx264rgb -crf 0 -preset ultrafast -c:a aac \
	"$HOME/Videók/screencast-$(date '+%y%m%d-%H%M-%S').mkv" &
	echo $! > /tmp/recordingpid


# Stream to twitch
ffmpeg -f alsa -i default -f x11grab -framerate 30 -video_size 1920x1080 \
-i :0.0+0,0 -c:v libx264 -preset ultrafast -b:v 6984k -maxrate 6984k -bufsize 3000k \
-pix_fmt yuv420p -g 60 -c:a aac -b:a 192k -ar 44100 \
-f flv rtmp://live-vie.twitch.tv/app/
