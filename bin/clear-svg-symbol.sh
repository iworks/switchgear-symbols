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
perl -pi -e 's/font-variant-caps:normal//g' ${FILE}
perl -pi -e 's/font-variant-east-asian:normal//g' ${FILE}
perl -pi -e 's/font-variant-numeric:normal//g' ${FILE}
perl -pi -e 's/font-variant-ligatures:normal//g' ${FILE}
perl -pi -e 's/stroke:none;stroke-width:[0-9]+\.[0-9]+/stroke:none/g' ${FILE}
perl -pi -e 's/;;+/;/g' ${FILE}
perl -pi -e 's/";+/"/g' ${FILE}
perl -pi -e 's/#000000/#000/g' ${FILE}
perl -pi -e 's/#ff0000/#f00/g' ${FILE}
perl -pi -e 's/#ffffff/#fff/g' ${FILE}
perl -pi -e 's/0\.29[0-9]+/0.3/g' ${FILE}
perl -pi -e 's/0\.30[0-9]+/0.3/g' ${FILE}
perl -pi -e 's/0\.20[0-9]+/0.2/g' ${FILE}
perl -pi -e 's/0\.10[0-9]+/0.1/g' ${FILE}
perl -pi -e 's/^ +//g' ${FILE}
perl -pi -e 's/ +$//g' ${FILE}
