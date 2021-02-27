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
   Hence, the output files are in `/viz` folder.
   
## Explanation: Visualization
Using geotagged tweet data from 2020 period, I utilized the MapReduce divide-and-conquer paradigm to analyze the tweets related to Coronavirus. I selected relevant tweets by selecting following hashtags:

   1. **#코로나바이러스**
   1. **#コロナウイルス**
   1. **#冠状病**
   1. **#covid2019**
   1. **#covid-2019**
   1. **#covid19**
   1. **#covid-19**
   1. **#coronavirus**
   1. **#corona**
   1. **#virus**
   1. **#flu**
   1. **#sick**
   1. **#cough**
   1. **#sneeze**
   1. **#hospital**
   1. **#nurse**
   1. **#doctor**

From a generic `#corona` tweets, we can see that the resulting 10 locations look very similar to top 10 countries with highest coronavirus cases (as of 02/26/2021), except for Argentina (#12th) and Netherlands (#21st), which suggests that the simple count reflects a magnitude of the COVID-19 spread. The above results are well-reflected in other hashtags as well, except for those that are country / language-specific (e.g., #코로나바이러스). Hence, as Spanish and Portuguese are widely spoken around the world (note that countries such as Brazil, Spain, and Colombia rank high in COVID-19 counts), we can see that the two languages rank high in numerous hashtags. While France does not appear in every files, it is important to mention that French ranks within Top 10 consistently across the hashtags, which can be explained by a pervasiveness of French speakers (5th most spoken language). 
