#!/bin/sh

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
	exit 1
fi

cd OneLife
git pull
cd minorGems
git pull
cd OneLifeData7
git pull
