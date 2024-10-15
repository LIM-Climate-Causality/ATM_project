#!/bin/bash

# Each file has the link format i.e:
# https://published.aer.com/era5_awssi/1950/era5_awssi_195001.nc
# https://published.aer.com/era5_awssi/1950/era5_awssi_195012.nc

# Directory to save the processed files
processed_dir="era5_awssi_processed/"
mkdir -p $processed_dir

# Loop through the years (from 1950 to 2023)
for year in {2005..2023}; do
    # Loop through the months (from 1 to 12)
    for month in {1..12}; do
        # Format month to ensure it has two digits (e.g., 01, 02, 03,...12)
        month_padded=$(printf "%02d" $month)
        
        # Download the file using wget
        file_url="https://published.aer.com/era5_awssi/${year}/era5_awssi_${year}${month_padded}.nc"
        temp_file="era5_awssi_${year}${month_padded}.nc"
        processed_file="${processed_dir}era5_awssi_${year}${month_padded}_processed.nc"
        
        echo "Downloading $file_url"
        wget -O $temp_file $file_url
        
        # Check if the download was successful
        if [[ -f "$temp_file" ]]; then
            echo "Selecting variables awssi_total and awssi_t2m from $temp_file"
            # Use CDO to select only awssi_total and awssi_t2m and save to the processed directory
            cdo selvar,awssi_total,awssi_t2m $temp_file $processed_file
            # Remove the original file
            rm $temp_file
        else
            echo "Failed to download $file_url"
        fi
    done
done