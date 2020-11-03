#!/bin/bash

filename="script_temp_devices_battery_info_+${date}"

upower --dump > "${filename}.txt"

models=$(awk '/model/ {print $2, $NF}' "./${filename}.txt")
percentages=$(awk '/percentage/ {print $NF}' "./${filename}.txt")

readarray -t models_arr <<<"$models"
readarray -t percentages_arr <<<"$percentages"

index=0
for i in "${models_arr[@]}"
do
    echo "${i}: ${percentages_arr[$index]}"
    index=${index}+1
done

rm "${filename}.txt"
