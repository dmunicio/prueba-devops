#!/bin/bash
BUCKET="devops-chicago-ta1-artifactory"
VERSION=$(cat version.txt | head -n 1)
cp -p cuenta /opt/versions/cuenta-$VERSION
echo "Uploaded to /opt/versions/cuenta-$VERSION"