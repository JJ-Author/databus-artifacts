#!/bin/bash
URL=`curl 'http://viaf.org/viaf/data/' | grep clusters-rdf.nt | grep -oP 'resource="\K[^"]+(?=")' | grep nt.gz`
echo $URL
mkdir -p downloads/$1
cd downloads/$1
wget $URL

