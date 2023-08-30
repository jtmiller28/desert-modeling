#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <target_directory>"
    exit 1
fi

target_directory="$1"
output_directory="/blue/soltis/millerjared/desert-modeling/outputs/"
output_file="$output_directory/line_counts.txt"

# Delete the output file if it already exists
if [ -e "$output_file" ]; then
    rm "$output_file"
fi

# Loop through each .txt file in the target directory
for txt_file in "$target_directory"/*.txt; do
    if [ -f "$txt_file" ]; then
        # Get the line count using wc -l
        line_count=$(wc -l < "$txt_file")
        
        # Append the line count and filename to the output file
        echo "$line_count $txt_file" >> "$output_file"
    fi
done

echo "Line counts written to $output_file"

