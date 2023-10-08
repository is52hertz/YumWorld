#!/bin/sh

echo "DATA7_BRANCH"
read DATA7_BRANCH
if [ "$DATA7_BRANCH" = "y" ]; then
        echo default
	DATA7_BRANCH=${DATA7_BRANCH:-master}
elif [ "$DATA7_BRANCH" != "y" ]; then
	DATA7_BRANCH=${DATA7_BRANCH:$DATA7_BRANCH}
fi
echo "DATA7_REPO"
read DATA7_REPO
DATA7_REPO=${DATA7_REPO:-https://github.com/jasonrohrer/OneLifeData7.git}
if [ ! -e OneLifeData7 ]
then
	git clone -b $DATA7_BRANCH $DATA7_REPO OneLifeData7
fi  
