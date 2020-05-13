## Upload a new release:
* check https://data.dnb.de/opendata/ and verify if new version exists
* run    mvn versions:set -DnewVersion="2020.02.13"      and set the new version according to dnb release date
* change metadata e.g. changelog if necessary
* run    mvn deploy -P fetch-release

## requirements (docker coming later)
* linux bash environment with common tools (zcat,wget,sed ...)
* rdf2rdf https://github.com/knakk/rdf2rdf
* lbzip2 
