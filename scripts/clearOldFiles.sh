#!/bin/sh

echo "Delete *.o ?："
read o
if [ "$o" = "yes" ]; then
        echo Delete *.o
	find . -type f -name '*.o' -exec rm {} +
elif [ "$o" = "y" ]; then
	echo Delete *.o
	find . -type f -name '*.o' -exec rm {} +
fi
echo "Delete *.dep?："
read dep
if [ "$dep" = "yes" ]; then
        echo Delete *.dep
	find . -type f -name '*.dep' -exec rm {} +
elif [ "$dep" = "y" ]; then
	echo Delete *.dep
	find . -type f -name '*.dep' -exec rm {} +
fi

echo "Delete *.cpp?："
read cpp
if [ "$cpp" = "yes" ]; then
        echo Delete *.cpp
	find . -type f -name '*.cpp' -exec rm {} +
elif [ "$cpp" = "y" ]; then
	echo Delete *.cpp
	find . -type f -name '*.cpp' -exec rm {} +
fi
echo "Delete *.sh?："
read sh
if [ "$sh" = "yes" ]; then
        echo Delete *.sh
	find . -type f -name '*.sh' -exec rm {} +
elif [ "$sh" = "y" ]; then
	find . -type f -name '*.sh' -exec rm {} +
fi
echo "Delete *.dep2?："
read dep2
if [ "$dep2" = "yes" ]; then
        echo Delete *.dep2
	find . -type f -name '*.dep2' -exec rm {} +
elif [ "$dep2" = "y" ]; then
	find . -type f -name '*.dep2' -exec rm {} +
fi
echo "Delete *.dep2?："
read make
if [ "$make" = "yes" ]; then
        echo Delete make*
	find . -type f -name "make*" -exec rm {} +
	find . -type f -name "Make*" -exec rm {} +
elif [ "$make" = "y" ]; then
	find . -type f -name "make*" -exec rm {} +
	find . -type f -name "Make*" -exec rm {} +
fi
echo "Delete *.h?："
read h
if [ "$h" = "yes" ]; then
        echo Delete *.h
	find . -type f -name "*.h" -exec rm {} +
elif [ "$h" = "y" ]; then
	find . -type f -name "*.h" -exec rm {} +
fi
echo "Delete *.?："
read h
if [ "$h" = "yes" ]; then
        echo Delete *.h
	find . -type f -name "*.h" -exec rm {} +
elif [ "$h" = "y" ]; then
	find . -type f -name "*.h" -exec rm {} +
fi
