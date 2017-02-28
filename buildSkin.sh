#! /bin/bash
mkdir build
mkdir target
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
# convert katie.png -resize 480x700 target/comboburst1.png
# convert katie.png -resize 960x1400 target/comboburst1@2x.png
# Build the skin file
mv target KDESkin
zip tmp.zip KDESkin/
mv tmp.zip KDESkin.osk
rm -fr KDESkin
rm -fr build
echo KDE Skin built successfully. Double click on KDESkin.osk to install the skin.
