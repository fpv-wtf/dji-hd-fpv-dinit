#!/bin/bash
NAME="dinit"
ARCH="armv7soft"
VERSION=$(cat ./control/control | grep Version | cut -d" " -f2)

echo $VERSION
exit

rm -rf debian-binary
rm -rf control.tar.gz
rm -rf data.tar.gz
rm -rf "${NAME}_${VERSION}_${ARCH}.ipk"

echo "2.0" > debian-binary

cd control
tar --numeric-owner --group=0 --owner=0 -czf ../control.tar.gz ./*
cd ..

cd data
tar --numeric-owner --group=0 --owner=0 -czf ../data.tar.gz ./*
cd ..

#tar --numeric-owner --group=0 --owner=0 -cf dinit_0.14.0pre_armv7soft.ipk ./debian-binary ./data.tar.gz ./control.tar.gz
ar rv "${NAME}_${VERSION}_${ARCH}.ipk" debian-binary data.tar.gz control.tar.gz
