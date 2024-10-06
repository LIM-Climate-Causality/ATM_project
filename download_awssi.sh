#!/bin/bash

# Each file has the link format i.e:
# https://published.aer.com/era5_awssi/1950/era5_awssi_195001.nc
# https://published.aer.com/era5_awssi/1950/era5_awssi_195012.nc

# Base URL for downloading the files
base_url="https://published.aer.com/era5_awssi"

# Loop through the years (1950 to 2023)
for year in {1950..2023}; do
  # Loop through the months (01 to 12)
  for month in {01..12}; do
    # Construct the URL for the specific year and month
    file_url="$base_url/$year/era5_awssi_${year}${month}.nc"

    # Download the file using wget
    echo "Downloading $file_url"
    wget $file_url -P era5_data/
  done
done
