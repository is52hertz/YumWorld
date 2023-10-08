#!/bin/sh

# Build Before
if [ ! -e "YumWorldLinux" ]
then
	mkdir YumWorldLinux
fi
if [ -d "YumWorldLinux" ]; then
    rm -r -f YumWorldLinux/*
fi

DATA7_BRANCH=${DATA7_BRANCH:-master}
DATA7_REPO=${DATA7_REPO:-https://github.com/jasonrohrer/OneLifeData7.git}
if [ ! -e OneLifeData7 ]
then
	git clone -b $DATA7_BRANCH $DATA7_REPO OneLifeData7
fi
MINORGEMS_BRANCH=${MINORGEMS_BRANCH:-skps}
MINORGEMS_REPO=${MINORGEMS_REPO:-https://github.com/is52hertz/YumWorldminorGems.git}
if [ ! -e minorGems ]
then
	git clone -b $MINORGEMS_BRANCH $MINORGEMS_REPO minorGems
fi
ONELIFE_BRANCH=${ONELIFE_BRANCH:-skps}
ONELIFE_REPO=${ONELIFE_REPO:-https://github.com/is52hertz/YumWorld.git}
if [ ! -e OneLife ]
then
	git clone -b $ONELIFE_BRANCH $ONELIFE_REPO OneLife
fi

cd YumWorldLinux

if [ ! -e OneLifeData7 ]
then
        mkdir OneLifeData7
	cp -rf ../OneLifeData7/* OneLifeData7/
fi
if [ ! -e minorGems ]
then
        mkdir minorGems
        cp -rf ../minorGems/* minorGems/
fi
if [ ! -e OneLife ]
then
        mkdir OneLife
        cp -rf ../OneLife/* OneLife/
fi
if [ ! -e animations ]
then
	cp -rf OneLifeData7/animations .	
fi

if [ ! -e categories ]
then
	cp -rf OneLifeData7/categories .	
fi

if [ ! -e ground ]
then
	cp -rf OneLifeData7/ground .	
fi

if [ ! -e music ]
then
	cp -rf OneLifeData7/music .	
fi

if [ ! -e objects ]
then
	cp -rf OneLifeData7/objects .	
fi

if [ ! -e sounds ]
then
	cp -rf OneLifeData7/sounds .	
fi

if [ ! -e sprites ]
then
	cp -rf OneLifeData7/sprites .	
fi

if [ ! -e transitions ]
then
	cp -rf OneLifeData7/transitions .	
fi

if [ ! -e dataVersionNumber.txt ]
then
	cp OneLifeData7/dataVersionNumber.txt .	
fi

# Building...
cd OneLife
chmod u+x ./configure
./configure 1

cd gameSource
echo "Building OneLife..."
make

cd ../..


echo "Making directories"
mkdir -p graphics
mkdir -p otherSounds
mkdir -p settings
mkdir -p languages
mkdir -p reverbCache
mkdir -p groundTileCache

echo "Current directory"
pwd
ls

echo "Copying items from build into directories"
cp OneLife/gameSource/OneLife ./YumWorldApp
cp OneLife/documentation/Readme.txt .
cp OneLife/no_copyright.txt .
cp OneLife/gameSource/graphics/* ./graphics
cp OneLife/gameSource/otherSounds/* ./otherSounds
cp OneLife/scripts/skps2010Scripts/translator.py .

rm -rf OneLife
rm -rf minorGems
rm -rf OneLifeData7

cd ..
zip -qr YumWorld.zip YumWorldLinux/*

echo "Done"
