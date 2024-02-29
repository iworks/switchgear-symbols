#!/usr/bin/env bash

# export LC_ALL=C

FILE="main.svg"

echo '<svg width="297mm" height="210mm" xmlns="http://www.w3.org/2000/svg">' > ${FILE}
echo "<!-- https://github.com/iworks/switchgear-symbols -->" >> ${FILE}

ratio=$(( 378 / 100 ))


start_x=-1800

#
# sockets
#
x=${start_x}
y=-600
for entry in `find ./library/sockets -type f|grep svg|sort`; do
    width=18
    step_x=$(( ratio * width ))
    # echo $entry;
    echo "<g transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}

    svg=$(<$entry)
    # echo $svg >> ${FILE}
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}

    echo '</g>' >> ${FILE}

    x=$(( x + step_x ))
    # y=$((y + step_y))
    # echo $entry
done

#
# devices 
#
x=${start_x}
y=-400
for entry in `find ./library/devices -type f|grep svg|sort`; do
    width=18
    if [[ $entry == *"2p"* ]]; then
        width=36
    fi
    if [[ $entry == *"3p"* ]]; then
        width=54
    fi
    step_x=$(( ratio * width ))
    # echo $entry;
    echo "<g transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}

    svg=$(<$entry)
    # echo $svg >> ${FILE}
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}

    echo '</g>' >> ${FILE}

    x=$(( x + step_x ))
    # y=$((y + step_y))
    # echo $entry
done


#
# switches
#
x=${start_x}
y=-200
for entry in `find ./library/switches -type f|grep svg|sort`; do
    width=18
    if [[ $entry == *"2p"* ]]; then
        width=36
    fi
    if [[ $entry == *"3p"* ]]; then
        width=54
    fi
    if [[ $entry == *"4p"* ]]; then
        width=72
    fi
    step_x=$(( ratio * width ))
    # echo $entry;
    echo "<g transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}

    svg=$(<$entry)
    # echo $svg >> ${FILE}
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}

    echo '</g>' >> ${FILE}

    x=$(( x + step_x ))
    # y=$((y + step_y))
    # echo $entry
done

#
# lights
#
x=${start_x}
y=0
for entry in `find ./library/lights -type f|grep svg|sort`; do
    width=18
    if [[ $entry == *"2p"* ]]; then
        width=36
    fi
    if [[ $entry == *"3p"* ]]; then
        width=54
    fi
    if [[ $entry == *"4p"* ]]; then
        width=72
    fi
    step_x=$(( ratio * width ))
    # echo $entry;
    echo "<g transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}

    svg=$(<$entry)
    # echo $svg >> ${FILE}
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}

    echo '</g>' >> ${FILE}

    x=$(( x + step_x ))
    # y=$((y + step_y))
    # echo $entry
done

#
# others
#
x=${start_x}
y=200
for entry in `find ./library/others -type f|grep svg|sort`; do
    width=18
    if [[ $entry == *"2p"* ]]; then
        width=36
    fi
    if [[ $entry == *"3p"* ]]; then
        width=54
    fi
    if [[ $entry == *"4p"* ]]; then
        width=72
    fi
    step_x=$(( ratio * width ))
    # echo $entry;
    echo "<g transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}

    svg=$(<$entry)
    # echo $svg >> ${FILE}
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}

    echo '</g>' >> ${FILE}

    x=$(( x + step_x ))
    # y=$((y + step_y))
    # echo $entry
done

echo "<text style='font-size:40px' x='${start_x}' y='-620'>Gniazda</text>" >> ${FILE}
echo "<text style='font-size:40px' x='${start_x}' y='-420'>Urządzenia</text>" >> ${FILE}
echo "<text style='font-size:40px' x='${start_x}' y='-220'>Włączniki</text>" >> ${FILE}
echo "<text style='font-size:40px' x='${start_x}' y='-20'>Światła</text>" >> ${FILE}
echo "<text style='font-size:40px' x='${start_x}' y='180'>Różne inne</text>" >> ${FILE}
echo "<text style='font-size:80px' x='${start_x}' y='-700'>BIBLIOTEKA</text>" >> ${FILE}
echo '<text style="font-size:12px;fill:#ff0000" x="600" y="760">Jeżeli Ci się podoba to może postaw mi kawę: https://ko-fi.com/iworks</text>' >> ${FILE}
echo "<g transform='translate(1050 720)'>" >> ${FILE}
echo $(<".github/ko-fi.com-iworks.svg") | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
echo '</g>' >> ${FILE}
echo '</svg>' >> ${FILE}
