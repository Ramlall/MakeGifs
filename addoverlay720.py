from PIL import Image

# Get a list of all files in Frames
from os import listdir, getcwd
from os.path import isfile, join
mypath = getcwd()
onlyfiles = [f for f in listdir(mypath + "/frames") if isfile(join(mypath + "/frames", f))]

# For each picture, overlay OB3LISK onto it.
for picfile in onlyfiles:
	background = Image.open("frames/" + picfile)
	foreground = Image.open("OB3LISK_Overlay720.png")

	background.paste(foreground, (0, 0), foreground)
	background.save("frames/" + picfile,"PNG")


# Go through each file in Frames and overwrite the image with the overlay on it.



#background = Image.open("Random720.png")
#foreground = Image.open("OB3LISK_Overlay.png")

#background.paste(foreground, (0, 0), foreground)
#background.save("new.png","PNG")
