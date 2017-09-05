#!/bin/bash
all:
	echo "Choose small or big"
	
big:
	mkdir frames
	ffmpeg -i input.mp4 -r 20 -vf fps=30 frames/frame%03d.png
	python addoverlay.py
	convert -delay 5 -loop 0 frames/frame*.png outputbig.gif
	rm frames -R
720ghetto:
	mkdir frames
	ffmpeg -i input.mp4 -r 20 -vf scale=720:-1,fps=10 frames/frame%03d.jpg
	convert -delay 5 -loop 0 frames/frame*.jpg output720.gif
	rm frames -R
540:
	mkdir frames
	ffmpeg -i input.mp4 -r 10 -vf scale=540:-1,fps=12 frames/frame%03d.jpg
	convert -delay 5 -loop 0 frames/frame*.jpg output540.gif
	rm frames -R
720:
	mkdir frames
	ffmpeg -i input.mp4 -r 20 -vf scale=720:-1,fps=20 frames/frame%03d.png
	python addoverlay720.py
	convert -delay 5 -loop 0 frames/frame*.png output720.gif
	rm frames -R

266:
	mkdir frames
	ffmpeg -i input.mp4 -r 20 -vf scale=266:-1,fps=20 frames/frame%03d.png
	convert -delay 5 -loop 0 frames/frame*.png output266.gif
	rm frames -R
webm:
	ffmpeg -i input.mp4 -vcodec libvpx -acodec libvorbis output.webm                                                          