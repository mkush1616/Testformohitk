#!/bin/bash

# Define output file
output_file="content_view_info.txt"

# Clear the file if it already exists
> "$output_file"

# Loop through each content view ID and run hammer info command
for id in $(hammer --no-headers --csv content-view list | awk -F, '{print $1}'); do
  echo "Fetching info for Content View ID: $id" >> "$output_file"
  hammer content-view info --id "$id" >> "$output_file"
  echo "--------------------------------------" >> "$output_file"
done

echo "Content View information saved to $output_file"
