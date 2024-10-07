#!/bin/bash

# Each file has the link format i.e:
# https://published.aer.com/era5_awssi/1950/era5_awssi_195001.nc
# https://published.aer.com/era5_awssi/1950/era5_awssi_195012.nc

# Directory to save the downloaded files
output_dir="era5_data/"
mkdir -p $output_dir

# Loop through the years (from 1950 to 2023)
for year in {1950..2023}; do
    # Loop through the months (from 1 to 12)
    for month in {1..12}; do
        # Format month to ensure it has two digits (e.g., 01, 02, 03,...12)
        month_padded=$(printf "%02d" $month)
        
        # Download the file using wget
        file_url="https://published.aer.com/era5_awssi/${year}/era5_awssi_${year}${month_padded}.nc"
        echo "Downloading $file_url"
        wget -P $output_dir $file_url
    done
done
