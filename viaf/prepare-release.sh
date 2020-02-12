#!/bin/bash
DATA_DIR=/data/id-management
REPO_DIR=/home/jfrey/global-identifiers
RDF_INPUT=$DATA_DIR/input/sameAs/for$1

if [[ -z $1 ]]; then
     echo "version string is required as argument"
       exit 1
fi


mkdir -p links/$1
cd links/$1
zcat ../../downloads/$1/*nt.gz | grep "> <http://schema.org/sameAs> <" | sed 's!http://schema.org/sameAs!http://www.w3.org/2002/07/owl#sameAs!' | lbzip -c > links_owlSameAs.nt.bz2
#mv -t links/$1 downloads/authorities*

