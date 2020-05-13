# Databus release setup for German National Library data
see https://databus.dbpedia.org/jj-author/dnb/ 

## Upload a new release:
* check for new release here https://data.dnb.de/opendata/ and [release changes](https://www.dnb.de/DE/Professionell/Metadatendienste/Datenbezug/LDS/ldsVersionshistorie.html)
* run    mvn versions:set -DnewVersion="2020.02.13"    and set the new version according to dnb release date
* change metadata e.g. changelog and LICENSE if necessary
* run    mvn deploy -P fetch-release

## requirements (docker coming later)
* linux bash environment with common tools (zcat,wget,sed ...)
* rdf2rdf https://github.com/knakk/rdf2rdf
* lbzip2 

## TODO
* check automtically for new release and license to allow cronjob
* verify completeness of new release
