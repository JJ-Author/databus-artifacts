#!/bin/bash

BASE=/root/databus-repo/jj-author/dnb
IN=$BASE/dnb-downloads/$1
OUT=$IN/converted
TMP=$IN/convertedtmp

if [[ -z $1 ]]; then
	        echo "version string is required as argument"
		                exit 1
			fi


####### convert files to ntriples

mkdir -p $OUT
mkdir -p $TMP

for file in $(find $IN -regex ".*gz$")
do
        tmp_name=$(echo ${file##*/} | sed 's,.ttl.gz,.ttl,g')
        new_name=$(echo ${file##*/} | sed 's,.ttl.gz,.nt,g')
        echo -n "converting to nt: $new_name "
        echo -n "> zcat "
        zcat $file > $TMP/$tmp_name
        echo -n "> rdf2rdf "
        rdf2rdf -in $TMP/$tmp_name -out $OUT/$new_name
        echo "> lbzip2"
        lbzip2 $OUT/$new_name
done

rm $TMP/*


####### rename files to contentvariants

for f in $OUT/authorities*; do rename  's/_lds//' $f; done
for f in $OUT/authorities*; do rename  's/authorities-/authorities_type=/' $f; done


####### extract sameAs links

for f in $OUT/*.nt.bz2
do
	ofile="${f%.nt.bz2}_owlSameAs.nt.bz2"
	echo "extracting sameAs links from $f to $ofile"
        lbzcat $f | grep "> <http://www.w3.org/2002/07/owl#sameAs> <" | lbzip2 -c > $ofile
done


####### copy files to mvn databus plugin folders 

mkdir -p $BASE/authorities/$1
mkdir -p $BASE/links/$1

mv -t $BASE/links/$1 $OUT/*_owlSameAs.nt.bz2
for f in $BASE/links/$1/authorities*; do rename  's/authorities_/links_/' $f; done
mv -t $BASE/authorities/$1 $OUT/authorities*






