#!/bin/bash
BUCKET="devops-chicago-ta1-artifactory"
VERSION=$(cat version.txt | head -n 1)
aws s3 cp cuenta s3://${BUCKET}/cuenta-$VERSION
