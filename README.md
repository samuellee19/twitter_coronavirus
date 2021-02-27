# Coronavirus analysis

This repo analyzes the activity of coronavirus hashtags on twitter.

## Tasks

1. Modified the `map.py` file so that it tracks the usage of the hashtags on both language and country levels.

1. Created a shell script `run_maps.sh` that loops over each file in the dataset and runs `map.py` on each file within the `/data/tweets_corona` folder in the lambda server.
   Execute `nohup ./run_maps.sh &` to ensure that map.py is executed in background on all files in parallel.

1. To run `reduce.py` to aggregate all of `.lang` and `.country` into two separate files, I created an `auto_viz.sh` file that automates the output process using
   ```
   ./src/visualize.py --input_path="$LANG_PATH" --key="$tag" | head > viz/"$tag.lang"
   ./src/visualize.py --input_path="$COUNTRY_PATH" --key="$tag" | head > viz/"$tag.country
   ```
   
## Explanation: Visualization
 
