#!/bin/bash

VERSION=$1

mv seec seec_$VERSION
tar -c seec_$VERSION | gzip > seec_$VERSION.orig.tar.gz
mv seec_$VERSION seec
