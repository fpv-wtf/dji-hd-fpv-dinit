#!/bin/bash
NAME=$(cat ./control/control | grep Package | cut -d" " -f2)
ARCH=$(cat ./control/control | grep Architecture | cut -d" " -f2)
VERSION=$(cat ./control/control | grep Version | cut -d" " -f2)

rm -rf ipk
rm -rf "${NAME}_${VERSION}_${ARCH}.ipk"

mkdir ipk

echo "2.0" > ipk/debian-binary

cd control
tar czvf ../ipk/control.tar.gz .
cd ..

cd data
tar czvf ../ipk/data.tar.gz .
cd ..

cd ipk
tar czvf ../${NAME}_${VERSION}_${ARCH}.ipk control.tar.gz data.tar.gz debian-binary
#ar rv "../${NAME}_${VERSION}_${ARCH}.ipk" ./*
