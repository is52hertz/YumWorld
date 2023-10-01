#!/bin/sh
cd ../..
if [ ! -e minorGems ]
then
	git clone https://github.com/skps2010/minorGems.git	
fi

if [ ! -e OneLife ]
then
	git clone https://github.com/skps2010/OneLife.git
fi

if [ ! -e OneLifeData7 ]
then
	git clone https://github.com/jasonrohrer/OneLifeData7.git	
fi
cd OneLife/gameSource
# -
./makeEditor.sh
rm ../../EditOneLife
cp EditOneLife ../../
rm EditOneLife
# -
cd ../..
./EditOneLife
cd OneLife/gameSource
