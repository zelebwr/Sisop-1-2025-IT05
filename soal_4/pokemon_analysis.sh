#!/bin/bash

# constants
INFO=("-i" "--info")
INFO_ARCHAIC="Abridgement"

# function to display show help
display_help() {
	echo -e "\n$0 [data_file_name] [options]"
	echo -e "\nOptions:\n"
	echo -e "\t-l, --link \t\tSpecify the link to use to get data. \n\t\t\t\tFollowed by [link] filled with the link pointing to the file. \n\t\t\t\tDefault is link for pokemon data.\n"
	echo -e "\t-d, --directory \tSpecify the directory of a file.
			\n\t\t\t\tFollowed by [directory] filled with the directory pointing to the file.\n" 
	echo -e "\t-i, --info \t\tTo get a summary of the highest value from each column, \n\t\t\t\treturning the row name from first column.\n"
	exit 0
}

display_help

DATA=$(curl -sSL 'https://drive.usercontent.google.com/u/0/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download')

MAX_VALUE=$(echo "$CSV_DATA" | awk -F, 'NR>1 {if ($3+0 > max) max=$3} END {print max}')

echo "By thy will, thou hast settled upon $INFO_ARCHAIC edict!"
echo "Thus, thine behest shall be mine ordinance!"


