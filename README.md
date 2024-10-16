# ATM_project
Student project for the Advanced Training Module - ATM

This repository contains scripts and instructions for downloading data and generating plots related to winter blocking events and the AWSSI (Accumulated Winter Season Severity Index). The scripts analyze and visualize atmospheric blocking events and AWSSI data over specified regions and time periods.

## Prerequisites

Before running the scripts, ensure you have the following installed:

Python 3.8 or higher
Conda package manager (optional but recommended)
Ensure wget is installed on your machine (e.g. for MacOS):

```brew install wget```

## Required Python Packages

xarray
numpy
pandas
matplotlib
cartopy
shapely
netCDF4 (optional, often installed with xarray)

## Data Download

The scripts require specific NetCDF data files for blocking events and AWSSI data. Use the provided bash scripts to download the necessary data.

Bash Scripts for Data Download
- Blocking Index Data Download Script: ```download_blocking_data.sh```
- AWSSI Data Download Script: ```download_awssi_data.sh```

To automate the download of all files between 1950 and 2023 (for each month from January to December) using a bash script with wget.
First, make the download_awssi.sh script executable. Then, run the script.

Make the bash scripts executable:

```chmod +x download_awssi.sh``` <!--To download the AWSSI data-->

```chmod +x awssi_data_processed.sh``` <!--To further process the AWSSI data, selecting winter months and region-->

```chmod +x blocking_index_data_processed.sh``` <!--Selecting the winter months and region-->

Run the bash scripts

```./download_awssi.sh```

```./awssi_data_processed.sh```

```./blocking_index_data_processed.sh```

## Scripts

## Winter Blocking and AWSSI Comparison

Script Name: ```winter_blocking_awssi_comparison.ipynb```

Description:

This script generates a side-by-side comparison plot of winter blocking events and winter AWSSI events. It creates two subplots in a polar stereographic projection, highlighting specific regions of interest.

Features:

- Loads and processes NetCDF data files for blocking events and AWSSI.
- Selects winter months (November to March) and computes the mean over time.
- Plots the data using matplotlib and cartopy.
- Adds arcs to highlight regions like the Atlantic, Pacific, Greenland, etc.
- Saves the figure as winter_blocking_awssi_comparison.png.