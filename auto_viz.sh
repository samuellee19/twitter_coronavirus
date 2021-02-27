#!/bin/bash

# 1) Run map.py using run_maps.sh

# Declare an array of hashtag strings
declare -a StringArray=("#코로나바이러스" "#コロナウイルス" "#冠状病毒" "#covid2019" "#covid-2019" "#covid19" "#covid-19" "#coronavirus" "#corona" "#virus" "#flu" "#sick" "#cough" "#sneeze" "#hospital" "#nurse" "#doctor" )

LANG_PATH='outputs_reduced/reduced.lang'
COUNTRY_PATH='outputs_reduced/reduced.country'

# Iterate hashtag strings
for tag in ${StringArray[@]}; do
    echo "Saving Occurrences of $tag"
    ./src/visualize.py --input_path="$LANG_PATH" --key="$tag" | head > viz/"$tag.lang"
    ./src/visualize.py --input_path="$COUNTRY_PATH" --key="$tag" | head > viz/"$tag.country"
done
