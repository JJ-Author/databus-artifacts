#!/bin/bash
BASE=/root/databus-repo/jj-author/dnb
IN=$BASE/dnb-downloads/$1
OUT=$IN/converted
TMP=$IN/convertedtmp



for f in $OUT/*.nt.bz2
do

		ofile="${f%.nt.bz2}_owlSameAs.nt.bz2"
	        echo "extracting same as links from $f to $ofile"
		        lbzcat $f | grep "> <http://www.w3.org/2002/07/owl#sameAs> <" | lbzip2 -c > $ofile
		done

