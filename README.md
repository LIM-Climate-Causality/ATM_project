# ATM_project
Student project for the Advanced Training Module - ATM

This repository contains scripts and instructions for downloading data and generating plots related to winter blocking events and the AWSSI (Accumulated Winter Season Severity Index). The scripts analyze and visualize atmospheric blocking events and AWSSI data over specified regions and time periods.

__Prerequisites__
Before running the scripts, ensure you have the following installed:

Python 3.8 or higher
Conda package manager (optional but recommended)
Ensure wget is installed on your machine (e.g. for MacOS):

```brew install wget```

__Required Python Packages__
xarray
numpy
pandas
matplotlib
cartopy
shapely
netCDF4 (optional, often installed with xarray)

__Data Download__
The scripts require specific NetCDF data files for blocking events and AWSSI data. Use the provided bash scripts to download the necessary data.

Bash Scripts for Data Download
- Blocking Index Data Download Script: ```download_blocking_data.sh```
- AWSSI Data Download Script: ```download_awssi_data.sh```

To automate the download of all files between 1950 and 2023 (for each month from January to December) using a bash script with wget.
First, make the download_awssi.sh script executable. Then, run the script.

Make the bash scripts executable:

```chmod +x download_awssi.sh``` # To download the AWSSI data

```chmod +x awssi_data_processed.sh``` # To further process the AWSSI data, selecting winter months and region

```chmod +x blocking_index_data_processed.sh``` # Selecting the winter months and region

Run the bash scripts

```./download_awssi.sh```

```./awssi_data_processed.sh```

```./blocking_index_data_processed.sh```
