#!/bin/bash
aws s3 cp s3://${BUCKET}/cuenta-$VERSION cuenta
mv cuenta /opt/
