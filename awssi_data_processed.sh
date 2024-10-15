###########################################!/bin/bash ###########################################

#!/bin/bash

# Directory containing the already downloaded processed files
input_dir="era5_data/"
# Directory to save the processed files
output_dir="era5_data/"
mkdir -p $output_dir

# Define the grid for regridding (2.5x2.5 degree)
grid_file="grid_2.5x2.5.txt"
cat <<EOL > $grid_file
gridtype = lonlat
xsize = 144
ysize = 73
xfirst = -180
xinc = 2.5
yfirst = -90
yinc = 2.5
EOL

# Function to check if month is in the desired range (November to March)
is_in_winter_season() {
    local month=$1
    if [[ "$month" -eq 11 || "$month" -eq 12 || "$month" -eq 1 || "$month" -eq 2 || "$month" -eq 3 ]]; then
        return 0  # True
    else
        return 1  # False
    fi
}

# Process each file in the input directory
for file in ${input_dir}/*.nc; do
    # Extract the year and month from the filename (assuming the format era5_awssi_<year><month>.nc)
    filename=$(basename "$file")
    year=$(echo "$filename" | cut -d'_' -f3 | cut -c1-4)
    month=$(echo "$filename" | cut -d'_' -f3 | cut -c5-6)
    
    # Convert month to integer to check if it falls within the winter season
    month_int=$(echo "$month" | sed 's/^0*//')
    
    if is_in_winter_season $month_int; then
        processed_file="${output_dir}/era5_awssi_${year}${month}_processed.nc"
        echo "Processing $file for year $year, month $month"
        
        # Select the region between 55 and 75 degrees latitude and regrid to 2.5x2.5 degrees
        cdo -sellonlatbox,-180,180,55,75 -remapbil,$grid_file $file $processed_file
        
        echo "Processed file saved to $processed_file"
    else
        echo "Skipping $file as it is outside the November to March range."
    fi
done

