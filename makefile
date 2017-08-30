#!/bin/bash
all:
	echo "Choose small or big"
	
big:
	#[ -f "$outputbig.gif" ] && rm "$outputbig.gif"
	#rm frames -R
	mkdir frames
	ffmpeg -i input.mp4 -r 10 frames/frame%03d.png
	convert -delay 5 -loop 0 frames/frame*.png outputbig.gif
	rm frames -R
	
small:
	#[ -f "$outputsmall.gif" ] && rm "$outputsmall.gif"
	#rm frames -R
	mkdir frames
	#ffmpeg -i input.mp4 -vf scale=320:-1:flags=lanczos,fps=30 frames/ffout%03d.png
	ffmpeg -i input.mp4 -vf scale=320:-1 -r 10 frames/frame%03d.png
	convert -delay 5 -loop 0 frames/frame*.png outputsmall.gif
	rm frames -R
	
720:
	mkdir frames
	ffmpeg -i input.mp4 -r 20 -vf scale=720:-1,fps=20 frames/frame%03d.png
	python addoverlay.py
	convert -delay 5 -loop 0 frames/frame*.png output720.gif
	rm frames -R