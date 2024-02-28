#!/usr/bin/env bash

filename="$(basename $0)"

if [ $# -ne 1 ]; then
	echo "Usage: ${filename} <file>"
	exit 1
fi

FILE=${1}
echo File: ${FILE}

TF=$(mktemp /tmp/505.XXXXXXXXX)
echo "COPY: $TF"

cp ${FILE} ${TF}

#
# replace 
#
perl -pi -e 's/<\![^>]+>//g' ${FILE}
perl -pi -e 's/<\?[^>]+>//g' ${FILE}
perl -pi -e 's/ (id|version|xmlns:svg|xml:space)="[^"]+"//g' ${FILE}
perl -pi -e 's/[\r\t\n ]+/ /g' ${FILE}
perl -pi -e 's/ +/ /g' ${FILE}
perl -pi -e 's/<def[^>]+>//g' ${FILE}
perl -pi -e 's/>[ \t\r\n]*</>\n</g' ${FILE}
perl -pi -e 's/font-style:normal//g' ${FILE}
perl -pi -e 's/font-variant:normal//g' ${FILE}
perl -pi -e 's/font-weight:normal//g' ${FILE}
perl -pi -e 's/font-stretch:normal//g' ${FILE}
perl -pi -e 's/line-height:1.25//g' ${FILE}
perl -pi -e 's/fill:#000000//g' ${FILE}
perl -pi -e 's/fill-opacity:1//g' ${FILE}
perl -pi -e 's/paint-order:markers stroke fill//g' ${FILE}
perl -pi -e 's/;;+/;/g' ${FILE}
perl -pi -e 's/";+/"/g' ${FILE}
perl -pi -e 's/;+"/"/g' ${FILE}
perl -pi -e 's/stroke-width:0.3[0-9]+/stroke-width:0.3/g' ${FILE}
