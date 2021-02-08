#!/bin/bash
key=$1
rm subconverter_linux64.tar.gz
rm -rf subconverter
mkdir -p "subconverter/out/$key"
curl -LO https://github.com/tindy2013/subconverter/releases/download/v0.6.4/subconverter_linux64.tar.gz
tar xvf subconverter_linux64.tar.gz
cp -r config/* subconverter
cat config/generate.ini | sed "s/{out}/out\/$key/g" > subconverter/generate.ini
subconverter/subconverter -g > /dev/null 2>&1
cp -f config/index.html subconverter/out
cp -f config/vercel.json subconverter/out
echo "$(date +'%Y-%m-%d %H:%M')" > "subconverter/out/$key/date.html"