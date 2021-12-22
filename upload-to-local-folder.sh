#!/bin/bash
BUCKET="devops-chicago-ta1-artifactory"
VERSION=$(cat version.txt | head -n 1)
if [ ! -f /opt/versions/cuenta-$VERSION ]
then
    cp -fp cuenta /opt/versions/cuenta-$VERSION
    echo "Uploaded to /opt/versions/cuenta-$VERSION"
else
    echo "/opt/versions/cuenta-$VERSION already uploaded"
fi
