#!/bin/bash

# functons

# Just a banter message
archaic_message() {
	echo -e "By thy will, thou hast settled upon $COMMAND \bedict!"
	echo -e "Thus, thine behest shall be mine ordinance!\n"
}

# error message for in general
error_general(){
	echo "Invalid argument: $1"
	echo "Try using -h or --help for help menu to see what options are available"
}

# error message when direst is invalid
error_direct(){
	echo "Try inserting a proper [URL]/[DIRECTORY]"
	echo "e.g. -d https://example.com/file.csv"
	echo "e.g. -d /home/user/file.csv"
}

# error message when search string is invalid
error_find(){
	echo "Try inserting a proper string [STR]"
	echo "e.g. -f Pikachu"
}

# error message when column can't be found or is not an integer or less than 0
error_column(){
	echo "Try inserting a proper number [NUM]"
	echo "e.g. -c 2"
}

# error message when the amount is bigger than the number of rows or negative value or not an integer
error_amount(){
	echo "Try inserting a proper number [NUM]"
	echo "e.g. -A 10"
}

# error message when output type is invalid
error_output(){
	echo "Try using -R or --row for output type"
	echo "Try using -f or --focused for output type"
}

# error message when the file is not a valid csv file
error_csv(){
	echo "File is not a CSV file"
	echo "Try inserting a proper CSV file"
	echo "e.g. -d https://example.com/file.csv"
	echo "e.g. -d /home/user/file.csv"
}

# display easter egg function
easter_egg() {
	echo -e "\n"
	cat << EOF
The Data's Inquisition of Revelation

Hark! A name, a "pokemon_script," thou’dst lend,
A trifling sound, where childish fancies bend.
But I, with wisdom's flame within my soul,
Proclaim a truth, where deeper powers roll!

No "pokemon_script," a paltry, weak design,
But "data's inquisition," truths divine!
A "grimoire potent," wrought of ancient lore,
Where thunderous knowledge shakes the very floor!

This instrument of old, a mystic key,
To secrets held, of legend's company.
The ancient games, the creatures of renown,
Their hidden codes, this scriven shall lay down.

No whimsy light, no games of idle play,
But mysteries vast, we summon to the day.
The fabric of all knowledge, we unfold,
And secrets hidden, centuries old!

By strength of this, this instrument of might,
We pierce the veil, and bring the dark to light.
For mastery's grasp, we strive with eager hand,
And lay the truth, bare for this knowing land!

The shadows flee, the mysteries unfold,
As potent secrets, centuries old,
Are brought to life, upon this hallowed throne,
And in their glory, let their might be known... Pokémon!
EOF
	echo -e "\n"
}

# display help menu function
help_menu() {

	# ASCII art
	echo "09 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5f 2c 2e 2d 2d 2d 2d 2d 2d 2e 2e 2e 2e 5f 5f 5f 2c 2e 27 20 27 2c 2e 2d 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2c 2d 27 20 20 20 20 20 20 20 20 20 20 5f 2c 2e 2d 2d 22 20 20 20 20 20 20 20 20 7c 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 5f 2e 2d 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 2c 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 20 2f 20 20 20 20 20 2f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 60 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 7c 20 20 20 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 2e 5c 0d 0a 20 20 20 20 20 20 20 5f 5f 5f 5f 20 20 20 20 20 20 7c 5f 5f 5f 2e 5f 2e 20 20 7c 20 20 20 20 20 20 20 5f 5f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 20 60 2e 0d 0a 20 20 20 20 20 2e 27 20 20 20 20 60 2d 2d 2d 22 22 20 20 20 20 20 20 20 60 60 22 2d 2e 2d 2d 22 27 60 20 20 5c 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 5c 0d 0a 20 20 20 20 2e 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 20 5f 5f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 20 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 20 2e 0d 0a 20 20 20 20 60 2c 27 20 20 20 20 20 20 20 20 20 2c 2d 22 27 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 20 20 4c 0d 0a 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 27 20 20 20 20 5f 2e 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2d 2e 5f 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 20 7c 0d 0a 20 20 2c 60 2d 2e 20 20 20 20 2c 22 2e 20 20 20 60 2d 2d 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 3e 2e 20 20 20 20 20 20 2c 27 20 20 20 20 20 7c 0d 0a 20 2e 20 2e 27 5c 27 20 20 20 60 2d 27 20 20 20 20 20 20 20 5f 5f 20 20 20 20 2c 20 20 2c 2d 2e 20 20 20 20 20 20 20 20 20 2f 20 20 60 2e 5f 5f 2e 2d 20 20 20 20 20 20 2c 27 0d 0a 20 7c 7c 3a 2c 20 2e 20 20 20 20 20 20 20 20 20 20 20 2c 27 20 20 3b 20 20 2f 20 20 2f 20 5c 20 60 20 20 20 20 20 20 20 20 60 2e 20 20 20 20 2e 20 20 20 20 20 20 2e 27 2f 0d 0a 20 6a 7c 3a 44 20 20 5c 20 20 20 20 20 20 20 20 20 20 60 2d 2d 27 20 20 27 20 2c 27 5f 20 20 2e 20 2e 20 20 20 20 20 20 20 20 20 60 2e 5f 5f 2c 20 5c 20 20 20 2c 20 2f 0d 0a 2f 20 4c 3a 5f 20 20 7c 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 22 27 20 3a 5f 3b 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 2e 27 2e 27 0d 0a 2e 20 20 20 20 22 22 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 22 22 22 22 22 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 56 0d 0a 20 60 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 20 20 60 2e 20 20 20 5f 2c 2e 2e 20 20 60 0d 0a 20 20 20 60 2c 5f 20 20 20 2e 20 20 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5f 2c 2d 27 2f 20 20 20 20 2e 2e 20 60 2c 27 20 20 20 5f 5f 20 20 60 0d 0a 20 20 20 20 29 20 5c 60 2e 5f 20 20 20 20 20 20 20 20 5f 5f 5f 2e 2e 2e 2e 2d 2d 2d 2d 22 27 20 20 2c 27 20 20 20 2e 27 20 20 5c 20 7c 20 20 20 27 20 20 5c 20 20 2e 0d 0a 20 20 20 2f 20 20 20 60 2e 20 22 60 2d 2e 2d 2d 22 27 20 20 20 20 20 20 20 20 20 5f 2c 27 20 2c 27 20 20 20 20 20 60 2d 2d 2d 27 20 7c 20 20 20 20 60 2e 2f 20 20 7c 0d 0a 20 20 2e 20 20 20 5f 20 20 60 22 22 27 2d 2d 2e 2e 5f 5f 5f 5f 5f 2e 2e 2d 2d 22 20 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 20 20 27 20 20 20 20 20 20 20 20 20 7c 0d 0a 20 20 7c 20 2e 22 20 60 2e 20 60 2d 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 2d 2e 20 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 20 20 20 20 20 20 20 2c 0d 0a 20 20 7c 20 60 2e 5f 2e 27 20 20 20 20 60 2c 5f 20 20 20 20 20 20 20 20 20 20 20 20 3b 20 20 2f 20 20 20 20 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 2e 0d 0a 20 2e 27 20 20 20 20 20 20 20 20 20 20 2f 7c 20 60 2d 2e 20 20 20 20 20 20 20 20 2e 20 2c 27 20 20 20 20 20 20 20 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 2c 0d 0a 20 27 2d 2e 5f 5f 20 5f 5f 20 5f 2c 27 2c 27 20 20 20 20 27 60 2d 2e 2e 5f 5f 5f 3b 2d 2e 2e 2e 5f 5f 20 20 20 2c 2e 27 5c 20 5f 5f 5f 5f 2e 5f 5f 5f 2e 27 0d 0a 20 60 22 5e 2d 2d 27 2e 2e 27 20 20 20 27 2d 60 2d 5e 2d 27 22 2d 2d 20 20 20 20 60 2d 5e 2d 27 60 2e 27 27 22 22 22 22 22 60 2e 2c 5e 2e 60 2e 2d 2d 27" | xxd -r -p

	# the main help menu
    cat << EOF


Usage: $0 [OPTIONS] ... [FILE]

Options:
  -h, --help              Show this help menu.

  -d, --direct [URL|DIR]  Load a CSV file from the given URL or directory.
  -i, --info              Display dataset summary.

  -s, --sort              Sort dataset.
      -c, --column [NUM]  Column to sort by.
      -R, --reverse       Sort in descending order.

  -f, --find [VALUE]      Search for a specific value.
      -c, --column [NUM]  Column to search.
      -A, --amount [NUM]  Limit the number of results.
      -E, --every         Output every matching row.
      -o, --output [TYPE] Output format: -r (--row), -f (--focused).

  -egg, --easter-egg        Show an easter egg message.

EOF
}

# check functions

# check if the file is a csv file
csv_dir_check(){
	local temp="$1"
	if [[ "$temp" == *.csv ]]; then
		return 0
	else
		return 1
	fi
}

# check if the url is valid
valid_url() {
    local url="$1"
    if curl --output /dev/null --silent --head --fail "$url"; then
        return 0  # URL is valid
    else
        return 1  # URL is not valid
    fi
}

# check if the link is a csv file
csv_link_check(){
	local temp="$1"
	if echo "$temp" | head -n 5 | grep -q ','; then
		return 0
	else
		return 1
	fi
}

# check if the argument is an integer
is_integer() {
    local s="$1"
    [[ "$s" =~ ^[0-9]+$ ]]
}

# default values
COMMAND=""

# CSV default values
CSV_LINK="https://drive.google.com/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download"
CSV_PATH_CHECK=0 # 0 for default direct, 1 for added direct

# info default values
INFO_CHECK=0 # 0 for no info, 1 for info

# sort default values
SORT_COLUMN=2 # default column to sort based on
SORT_COLUMN_CHECK=0 # 0 for no column, 1 for column
SORT_REVERSE=0 # 0 for ascending, 1 for descending
SORT 

# find default values
FIND_CHECK=0 # 0 for no find, 1 for find
FIND_VALUE=""
FIND_COLUMN=1 # default column to find based on
FIND_AMOUNT=10 # default amount to output
OUTPUT_TYPE="-r" # default output type
FIND_EVERY=0 # 0 for no every, 1 for every

# argument parsing
while [ $# -gt 0 ]; do
	case "$1" in 
	 	# main: HELP
		-h|--help) help_menu; exit 0;;

		# main: DIRECT
		-d|--direct)
			COMMAND+="Acquisition "
			# check if the next argument is empty or starts with '-'
			if [[ -z "$2" || "$2" =~ ^- ]]; then 
				echo "The next argument cant't be empty or starts with '-'."
				echo "Try: -d https://example.com/file.csv"
				echo "Try: --direct /home/user/file.csv"
				echo "Try using -h or --help for help."
				exit 1;
			else
			# check if it's a link or path 
			if [[ "$2" =~ ^https?:// ]]; then 
				if curl --output /dev/null --silent --head --fail "$2"; then
					CSV_FILE=$(curl -s -L"$2")
					if echo "$CSV_FILE" | head -n 1 | grep -q ','; then
						echo "The requested data hath been procured with utmost success!"
						CSV_LINK="$2"
						shift 2
					else 
						echo "Data: $2"
						echo "The data, alas, falls short of the mark, and doth not meet the prescribed standards. See to it that it be rendered in the form of a comma-separated scroll, as is required!"
						echo -e "\nData is not in CSV format."
						echo "Please add a URL that contains a CSV file."
						exit 1
					fi
				else
					echo "Data: $2"
					echo "The data, I regret to report, is wanting in its retrieval. I entreat you, make another effort. If circumstances allow, explore the use of a distinct pathway to its acquisition."
					echo -e "\n Data has failed to be retrieved"
					echo "Please check the URL and try again."
					exit 1
				fi
			else
				if [ -e "$2"]; then 
					if [[ "$2" == *.csv ]]; then
						echo "Data: $2"
						echo "The requested data hath been procured with utmost success!"
						CSV_PATH_CHECK=1 # added direct
						shift 2
					else 
						echo "Data: $2"
						echo "The data, alas, falls short of the mark, and doth not meet the prescribed standards. See to it that it be rendered in the form of a comma-separated scroll, as is required!"
						echo -e "\nData is not in CSV format."
						echo "Please add a path directing to a CSV file."
						exit 1
					fi 
				else 
					echo "Data: $2"
					echo "The data, I regret to report, is wanting in its retrieval. I entreat you, make another effort. If circumstances allow, explore the use of a distinct pathway to its acquisition."
					echo -e "\n Data has failed to be retrieved"
					echo "Please check the path and try again."
					exit 1
				fi
			fi
			;;
		
		# main: INFO
		-i|--info)
			COMMAND += "Erudition "
			INFO_CHECK=1
			break
			;;
		
		# main: SORT
		-s|--sort)
			COMMAND+="Disposition "
			# sort the able
			shift
			while [ $# -gt 0 ]; do 
				case "$1" in

					# sub SORT: COLUMN
					-c|--column)
						# check if the next argument is empty or starts with '-'
						if [[ -z "$2" || "$2" =~ ^- ]]; then 
							echo -e "The \"$2\" cant't be empty or starts with '-'."
							echo "Try: -c 2; to refer to sort based on column 2"
							echo "Try using -h or --help for help."
							exit 1;
						else
							# check if it's an integer or not
							if [[ "$2" =~ ^[0-9]+$ ]]; then
								SORT_COLUMN=$2
								SORT_COLUMN_CHECK=1
								shift 2
							else 
								echo -e "The \"$2\" argument must be an integer."
								echo "Try: -c 2; to refer to sort based on column 2"
								echo "Try using -h or --help for help."
								exit 1;
							fi
						fi
						;;
					
					# sub SORT: REVERSE
					-R|--reverse)
						COMMAND+="Inversion "
						shift
						fi
						;;

					# sub SORT: EXIT
					*) break;; 
				esac
			done
			;;

		# main: FIND
		-f|--find)
			COMMAND+="Inquisition "
			FIND_CHECK=1 # 1 for find
			# check if the next argument is empty or starts with '-'
			if [[ -z "$2" || "$2" =~ ^- ]]; then
				echo -e "The "$2" argument cant't be empty or starts with '-'."
				echo "Try: -f Pikachu; to search for Pikachu"
				echo "Try using -h or --help for help."
			else
				FIND_VALUE="$2" # find value
				while [ $# -gt 0 ]; do
					case "$1" in
						
						# sub SORT: COLUMN
						-c|--column)
							# check if the next argument is empty or starts with '-'
							if [[ -z "$2" || "$2" =~ ^- ]]; then 
								echo -e "The \"$2\" cant't be empty or starts with '-'."
								echo "Try: -c 2; to refer to sort based on column 2"
								echo "Try using -h or --help for help."
								exit 1;
							else
								# check if it's an integer or not
								if [[ "$2" =~ ^[0-9]+$ ]]; then
									SORT_COLUMN=$2
									SORT_COLUMN_CHECK=1
									shift 2
								else 
									echo -e "The \"$2\" argument must be an integer."
									echo "Try: -c 2; to refer to sort based on column 2"
									echo "Try using -h or --help for help."
									exit 1;
								fi
							fi
							;;

						# sub FIND: AMOUNT
						-A|--amount)
							# check if the next argument is empty or starts with '-'
							if [[ -z "$2" || "$2" =~ ^- ]]; then 
								echo -e "The \"$2\" argument cant't be empty or starts with '-'."
								echo "Try: -A 10; to output top 10 results from the search"
								echo "Try using -h or --help for help."
								exit 1;
							else
								if [[ "$2" =~ ^[0-9]+$ ]]; then
									FIND_AMOUNT=$2
									shift 2
								else 
									echo -e "The \"$2\" argument must be an integer."
									echo "Try: -A 10; to output top 10 results from the search"
									echo "Try using -h or --help for help."
									exit 1;
								fi
							fi
							;;
						
						# sub FIND: EVERY
						-E|--every)
							FIND_EVERY=1 # 1 for every
							shift
							;;

						# sub FIND: OUTPUT
						-o|--output)
							# check if the next argument is empty or starts with '-'
							if [[ -z "$2" ]]; then 
								echo "The next argument cant't be empty."
								echo "Try: -o -r; to output the results per row"
								echo "Try using -h or --help for help."
							else 
								if [[ "$2" == "-r" || "$2" == "--row" || "$2" == "-f" || "$2" == "--focused" ]]; then
									OUTPUT_TYPE="$2"
									shift 2
								else 
									echo "The \"$2\" argument must be -r or --row or -f or --focused."
									echo "Try: -o -r; to output the results per row"
									echo "Try using -h or --help for help."
									exit 1;
								fi
							fi
							;;
						
						# sub FIND: EXIT
						*) break;;
					esac
				done
			fi
			;;

		-egg|--easter-egg)
			easter_egg
			exit 0
			;;

		*) break;; 
	esac
done

# read the document
if [ $CSV_PATH_CHECK -eq 1 ]; then
	CSV_FILE=$(cat "$2")
else
	CSV_FILE=$(curl -s -L "$CSV_LINK")
fi

# retrieve CSV_HEADER
CSV_HEADER=$(echo "$CSV_FILE" | head -n 1)

# info the document
if [ INFO_CHECK -eq 1 ]; then
	CSV_FILE=$(echo "$CSV_FILE" | sort -t, -nrk$SORT_COLUMN)

	archaic_message

	echo "$CSV_FILE" | awk -F, '
		NR==1 {for (i=2; i<=NF; i++) header[i-1] = $i; next}
			{
			for (i=2; i<=NF; i++) {
				if ($i+0 > max_col[i]+0) {
					max_col[i-1] = $i;
					max_row[i-1] = $1;
				}
			}
		}
		END {
			for (i=2; i<=NF; i++)
				if (max_col[i-1] != "") 
					print "The highest value for " header[i-1] " is " max_col[i-1] " by " max_row[i-1];
		}'
fi

# sort the document
if [ $SORT_CHECK -eq 1 ]; then
	if [ $SORT_REVERSE -eq 0 ]; then # ascending
		CSV_FILE=$(echo "$CSV_FILE" | sort -t, -nk$SORT_COLUMN) 
	elif [ $SORT_REVERSE -eq 1 ]; then # descending
		CSV_FILE=$(echo "$CSV_FILE" | sort -t, -nrk$SORT_COLUMN)
	fi
fi

# find the document
if [ $FIND_CHECK -eq 1 ]; then

	CSV_TAIL=$(echo "$CSV_FILE" | awk -F, -v col="$FIND_COLUMN" -v val="$FIND_VALUE" '
        $col ~ val {
            print $0;
        }
    ')

	# check if the value is found
	if [ -z "$CSV_TAIL" ]; then
        echo "The string \"$FIND_VALUE\" could not be found in column $FIND_COLUMN."
        exit 1
    fi

	 # Continue processing if the string is found
    if [ $OUTPUT_TYPE == "-r" ] || [ $OUTPUT_TYPE == "--row" ]; then
        echo "$CSV_HEADER"
        echo "$CSV_TAIL"
    elif [ $OUTPUT_TYPE == "-f" ] || [ $OUTPUT_TYPE == "--focused" ]; then
        echo "$CSV_TAIL" | grep -o "$FIND_VALUE"
        echo -n "The amount of occurrences of the focused value is: "
        echo "$CSV_TAIL" | grep -o "$FIND_VALUE" | wc -l
    fi
fi

# output sorted dataset
if [ $SORT_CHECK -eq 1 && $FIND_CHECK -eq 0 ]; then
	echo "$CSV_HEADER"
	echo "$CSV_FILE"
fi