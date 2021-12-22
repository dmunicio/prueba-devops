#!/bin/bash

RESULTADO=$(./cuenta 1 2 3)
if [ "$RESULTADO" != "3" ]
then
	echo "Test ERROR: $RESULTADO != 3"
	exit -1
fi

RESULTADO=$(./cuenta )
if [ "$RESULTADO" != "0" ]
then
	echo "Test ERROR: $RESULTADO != 0"
	exit -1
fi

echo "Tests OK"

