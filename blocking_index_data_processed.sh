#!/bin/bash

# Define directories
input_dir="/climca/people/eaoko/work/ERA5_Z500_BLOCKING_INDEX/"
output_dir="/climca/people/ralawode/ATM/blocking_index/"
mkdir -p $output_dir

# Define the custom 2.5x2.5 degree grid
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

# Loop through years and months
for year in {1940..2023}; do
    for month in {01..12}; do
        # Define the input and output file names
        input_file="${input_dir}Blocking_1D_${year}-${month}.nc"
        output_file="${output_dir}Blocking_1D_${year}-${month}_processed.nc"
        
        # Check if input file exists
        if [ -f "$input_file" ]; then
            echo "Processing $input_file for year $year, month $month"
            
            # Check if November to March (months 11 to 03)
            if [ "$month" -ge 11 ] || [ "$month" -le 03 ]; then
                # Perform selection of region (55 to 75 latitude) and remapping with custom 2.5x2.5 degree grid
                cdo -sellonlatbox,-180,180,55,75 -remapbil,$grid_file "$input_file" "$output_file"
                echo "Processed file saved to $output_file"
            else
                echo "Skipping $input_file as it is outside the November to March range."
            fi
        else
            echo "File $input_file does not exist, skipping."
        fi
    done
done

# Clean up grid file
rm $grid_file

echo "Processing completed."