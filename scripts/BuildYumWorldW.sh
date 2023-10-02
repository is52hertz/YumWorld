#!/bin/sh

# Build Before
if [ $# -lt 1 ] ; then
   echo "Usage: $0 release_name"
   exit 1
fi

if [ ! -e YumWorldWindows ]
then
	mkdir YumWorldWindows
fi
if [ -d "YumWorldWindows" ]; then
    rm -r -f YumWorldWindows/*
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

cd YumWorldWindows

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

# WIN
if [ ! -e SDL-1.2.15 ]
then
	wget https://www.libsdl.org/release/SDL-devel-1.2.15-mingw32.tar.gz
	tar -xvzf SDL-devel-1.2.15-mingw32.tar.gz
	rm SDL-devel-1.2.15-mingw32.tar.gz
fi
if [ ! -e mingw32 ]
then
	wget https://mirror.msys2.org/mingw/mingw32/mingw-w64-i686-freetype-2.13.2-1-any.pkg.tar.zst
	tar --use-compress-program=unzstd -xvf mingw-w64-i686-freetype-2.13.2-1-any.pkg.tar.zst
	rm mingw-w64-i686-freetype-2.13.2-1-any.pkg.tar.zst
fi
if [ ! -e SDL ]
then
	ln -s SDL-1.2.15/include/SDL .
fi
if [ ! -e Winsock.h ]
then
	ln -s /usr/i686-w64-mingw32/include/winsock.h Winsock.h
fi
if [ ! -e freetype2 ]
then
	ln -s mingw32/include/freetype2 .
fi
# Building...
cd OneLife

./configure 5
cd gameSource
make

cd ../build
./makeDistributionWindows v$1

cp ../scripts/skps2010Scripts/translator.py "windows/OneLife_v$1"
cp ../scripts/skps2010Scripts/translator.exe "windows/OneLife_v$1"

mv "windows/OneLife_v$1" "../../"

cd ../../

echo "done building OneLife_v$1"

cd ..
zip -r -q YumWorld_Windows.zip YumWorldWindows/OneLife_v$1/*

echo "done"
