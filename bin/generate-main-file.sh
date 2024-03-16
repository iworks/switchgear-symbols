#!/usr/bin/env bash

# export LC_ALL=C

FILE="main.svg"

if [ ! -f ${FILE} ]; then
    echo "File \"${FILE}\" does not exist."
    exit
fi

echo '<svg width="297mm" height="210mm" xmlns="http://www.w3.org/2000/svg">' > ${FILE}
echo "<!-- https://github.com/iworks/switchgear-symbols -->" >> ${FILE}

ratio="3.78"


start_x=-350
start_y=-1000

function get_width() {
    if [[ $entry == *"-05p"* ]]; then
        echo 9
        exit
    fi
    if [[ $1 == *"-2p"* ]]; then
        echo 36
        exit
    fi
    if [[ $entry == *"-25p"* ]]; then
        echo 45
        exit
    fi
    if [[ $entry == *"-3p"* ]]; then
        echo 54
        exit
    fi
    if [[ $entry == *"-4p"* ]]; then
        echo 72
        exit
    fi
    if [[ $1 == *"-12p"* ]]; then
        echo 216
        exit
    fi
    if [[ $1 == *"-16p"* ]]; then
        echo 288
        exit
    fi
    echo 18
}


#
# sockets
#
x=${start_x}
y=${start_y}
for entry in `find ./library/sockets -type f|grep svg|sort`; do
    width=18
    step_x=`echo "print ${ratio} * ${width}" | perl`
    echo "<g data-file=\"${entry}\" transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}
    svg=$(<$entry)
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
    echo '</g>' >> ${FILE}
    x=`echo "print ${x} + ${step_x}" | perl`
done

#
# devices 
#
x=${start_x}
y=$(( start_y + 200 ))
for entry in `find ./library/devices -type f|grep svg|sort`; do
    width=`get_width $entry`
    step_x=`echo "print ${ratio} * ${width}" | perl`
    echo "<g data-file=\"${entry}\" transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}
    svg=$(<$entry)
    # echo $svg >> ${FILE}
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
    echo '</g>' >> ${FILE}
    x=`echo "print ${x} + ${step_x}" | perl`
done

#
# switches
#
x=${start_x}
y=$(( start_y + 400 ))
for entry in `find ./library/switches -type f|grep svg|sort`; do
    width=`get_width $entry`
    step_x=`echo "print ${ratio} * ${width}" | perl`
    echo "<g data-file=\"${entry}\" transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}
    svg=$(<$entry)
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
    echo '</g>' >> ${FILE}
    x=`echo "print ${x} + ${step_x}" | perl`
done

#
# lights
#
x=${start_x}
y=$(( start_y + 600 ))
for entry in `find ./library/lights -type f|grep svg|sort`; do
    width=`get_width $entry`
    step_x=`echo "print ${ratio} * ${width}" | perl`
    echo "<g data-file=\"${entry}\" transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}
    svg=$(<$entry)
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
    echo '</g>' >> ${FILE}
    x=`echo "print ${x} + ${step_x}" | perl`
done

#
# others
#
x=${start_x}
y=$(( start_y + 800 ))
for entry in `find ./library/others -type f|grep svg|sort`; do
    width=`get_width $entry`
    step_x=`echo "print ${ratio} * ${width}" | perl`
    echo "<g data-file=\"${entry}\" transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}
    svg=$(<$entry)
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
    echo '</g>' >> ${FILE}
    x=`echo "print ${x} + ${step_x}" | perl`
done

#
# example
#
x=40
y=40
files=( \
    "library/switches/main-switch-4p-with-phases.svg" \
    "library/others/blank-2p.svg" \
    "library/others/indicator-1p-2.svg" \
    "library/devices/ev-station-3p.svg" \
    "library/sockets/socket-room-bathroom-1p.svg" \
    "library/sockets/socket-room-hall-1p.svg" \
    "library/sockets/socket-room-bedroom-1p.svg" \
    "library/sockets/socket.svg" \
    "library/sockets/socket-room-office-1p.svg" \
)
for entry in ${files[@]}; do
    width=`get_width $entry`
    step_x=`echo "print ${ratio} * ${width}" | perl`
    #
    # print
    #
    echo "<g transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}
    svg=$(<$entry)
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
    echo '</g>' >> ${FILE}
    #
    # count
    #
    x=`echo "print ${x} + ${step_x}" | perl`
done
#
# example 2
#
x=40
y=240
files=( \
    "library/switches/residual-current-circuit-breaker-3p.svg" \ 
    "library/devices/kitchen-dishwasher-1p.svg" \
    "library/devices/kitchen-stove-1p.svg" \
    "library/devices/kitchen-oven-1p.svg" \
    "library/devices/kitchen-fridge-1p.svg" \
    "library/devices/kitchen-hood-1p.svg" \
    "library/devices/livingroom-air-conditioner-1p.svg" \
    "library/devices/livingroom-audio-1p.svg" \
    "library/devices/livingroom-tv-1p.svg" \
    "library/devices/livingroom-aquarium-3p.svg" \
    "library/devices/livingroom-projector-1p.svg" \
)
for entry in ${files[@]}; do
    width=`get_width $entry`
    step_x=`echo "print ${ratio} * ${width}" | perl`
    #
    # print
    #
    echo "<g transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}
    svg=$(<$entry)
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
    echo '</g>' >> ${FILE}
    #
    # count
    #
    x=`echo "print ${x} + ${step_x}" | perl`
done

#
# example 3
#
x=40
y=440
files=( \
    "library/switches/residual-current-circuit-breaker-3p.svg" \ 
    "library/others/meter-electric-3p.svg" \
    "library/devices/outside-gate-1p.svg" \
    "library/devices/outside-pool-3p.svg" \
    "library/devices/outside-robot-mower-outline-1p.svg" \
    "library/devices/outside-sprinkler-1p.svg" \
    "library/others/blank-05p.svg" \
    "library/others/socket-25p.svg" \
)
for entry in ${files[@]}; do
    width=`get_width $entry`
    step_x=`echo "print ${ratio} * ${width}" | perl`
    #
    # print
    #
    echo "<g transform=\"translate(${x} ${y}) scale(${ratio})\">" >> ${FILE}
    svg=$(<$entry)
    echo $svg | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
    echo '</g>' >> ${FILE}
    #
    # count
    #
    x=`echo "print ${x} + ${step_x}" | perl`
done



echo "<text style='font-size:40px' x='${start_x}' y='$((start_y - 20 ))'>Gniazda</text>" >> ${FILE}
echo "<text style='font-size:40px' x='${start_x}' y='$((start_y + 180 ))'>Urządzenia</text>" >> ${FILE}
echo "<text style='font-size:40px' x='${start_x}' y='$((start_y + 380 ))'>Włączniki</text>" >> ${FILE}
echo "<text style='font-size:40px' x='${start_x}' y='$((start_y + 580 ))'>Światła</text>" >> ${FILE}
echo "<text style='font-size:40px' x='${start_x}' y='$((start_y + 780 ))'>Różne inne</text>" >> ${FILE}
echo "<text style='font-size:80px' x='${start_x}' y='$((start_y - 100 ))'>BIBLIOTEKA <tspan style=\"font-size:30px\">(`date +"%c"`)</tspan></text>" >> ${FILE}
echo '<text style="font-size:12px;fill:#ff0000" x="600" y="760">Jeżeli Ci się podoba to może postaw mi kawę: https://ko-fi.com/iworks</text>' >> ${FILE}
echo "<g transform='translate(1050 720)'>" >> ${FILE}
echo $(<".github/ko-fi.com-iworks.svg") | sed -e 's/<svg[^>]\+>//' -e 's/<\/svg>//' >> ${FILE}
echo '</g>' >> ${FILE}
echo '</svg>' >> ${FILE}
