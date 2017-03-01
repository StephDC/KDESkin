#! /bin/bash
mkdir build
mkdir target
# Copy some configuration files to the target folder
# Use hard link to save some space - Should we change it to copy?
ln asset/skin.ini target/skin.ini
# Fetch some other files from the Internet
# Konqi for ComboBurst and Scoreboard
wget -O build/mascot_20130120_KDE_3_transparent.png http://www.heatwo.com/temp/mascot_20130120_KDE_3_transparent.png

# Crop the images out of the large image
convert build/mascot_20130120_KDE_3_transparent.png -crop 1750x1850+2440+660 build/katie.png
convert build/mascot_20130120_KDE_3_transparent.png -crop 2580x850+612+5552 build/sleepkonqi.png
convert build/mascot_20130120_KDE_3_transparent.png -crop 1940x1860+4735+650 -fill '#ff00ff' -draw 'rectangle 1720,400 1940,1270' -draw 'rectangle 1580,900 1940,1200' -draw 'rectangle 1620,1800 1940,1860' -transparent '#ff00ff' build/konqi.png
convert build/mascot_20130120_KDE_3_transparent.png -crop 2750x2750+390+2560 -fill '#ff00ff' -draw 'rectangle 2650,1250 2750,1800' -transparent '#ff00ff' build/together.png

# Tux from WikiMedia Commons
wget -O build/853px-NewTux.svg.png https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/NewTux.svg/853px-NewTux.svg.png

# Make combobursts
convert build/katie.png -resize 480x700 target/comboburst1.png
convert build/katie.png -resize 960x1400 target/comboburst1@2x.png
convert build/konqi.png -resize 480x700 target/comboburst2.png
convert build/konqi.png -resize 960x1400 target/comboburst2@2x.png
convert build/853px-NewTux.svg.png -resize 480x700 target/comboburst3.png
convert build/853px-NewTux.svg.png -resize 960x1400 target/comboburst3@2x.png

# Make cursor
convert -size 76x76 xc:transparent -fill blue -draw 'circle 38,38 38,9' -blur 7x7 -fill white -draw 'circle 38,38 38,25' -blur 3x3 -resize 50x50 target/cursor.png
convert -size 152x152 xc:transparent -fill blue -draw 'circle 76,76 76,18' -blur 14x14 -fill white -draw 'circle 76,76 76,50' -blur 6x6 -resize 100x100 target/cursor@2x.png
convert -size 76x76 xc:transparent -fill radial-gradient:cyan-transparent -draw 'circle 38,38 38,1' target/cursortrail.png
convert -size 152x152 xc:transparent -fill radial-gradient:cyan-transparent -draw 'circle 76,76 76,1' target/cursortrail@2x.png

# Make CatchTheBeat Fruits
rsvg-convert breeze-icons/icons/apps/64/utilities-terminal.svg -w 128 -a -o target/fruit-grapes.png
rsvg-convert breeze-icons/icons/apps/64/utilities-terminal.svg -w 128 -a -o target/fruit-grapes-overlay.png
# convert katie.png -resize 480x700 target/comboburst1.png
# convert katie.png -resize 960x1400 target/comboburst1@2x.png
# Build the skin file
mv target KDESkin
zip tmp.zip KDESkin/
mv tmp.zip KDESkin.osk
rm -fr KDESkin
rm -fr build
echo KDE Skin built successfully. Double click on KDESkin.osk to install the skin.
