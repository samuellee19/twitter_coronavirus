#!/bin/bash

# in bash, the `*` character is called the glob
for item in /data-fast/twitter2020/*.zip; do
    ./src/map.py --input_path=$item &  # change this to maps command
done
