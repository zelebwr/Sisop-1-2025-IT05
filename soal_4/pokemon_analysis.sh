#!/bin/bash

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

# Default Values
COMMAND=""
INFO_CHECK=0 # 0 for not summary, 1 for summary
SORT_CHECK=0 # 0 for not sorted, 1 for sorted
SORT_OUTPUT=0 # 0 for not outputted, 1 for outputted
SORT_ORDER=0 # 0 for ascending, 1 for descending
SORT_COLUMN=1 
FIND_COLUMN=1
FIND_AMOUNT=10
FIND_CHECK=0 # 0 for not find, 1 for find
FIND_VALUE=""
OUTPUT_TYPE="-r" # -r for row, -c for column, -f for focused
EVERY_MATCH=0
CSV_LINK="https://drive.usercontent.google.com/u/0/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download"
CSV_DIR=0 # 0 for not directory, 1 for directory

# Display help menu
help_menu() {
	echo "09 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5f 2c 2e 2d 2d 2d 2d 2d 2d 2e 2e 2e 2e 5f 5f 5f 2c 2e 27 20 27 2c 2e 2d 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2c 2d 27 20 20 20 20 20 20 20 20 20 20 5f 2c 2e 2d 2d 22 20 20 20 20 20 20 20 20 7c 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 5f 2e 2d 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 2c 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 20 2f 20 20 20 20 20 2f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 60 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 7c 20 20 20 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 2e 5c 0d 0a 20 20 20 20 20 20 20 5f 5f 5f 5f 20 20 20 20 20 20 7c 5f 5f 5f 2e 5f 2e 20 20 7c 20 20 20 20 20 20 20 5f 5f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 20 60 2e 0d 0a 20 20 20 20 20 2e 27 20 20 20 20 60 2d 2d 2d 22 22 20 20 20 20 20 20 20 60 60 22 2d 2e 2d 2d 22 27 60 20 20 5c 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 5c 0d 0a 20 20 20 20 2e 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 20 5f 5f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 20 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 20 2e 0d 0a 20 20 20 20 60 2c 27 20 20 20 20 20 20 20 20 20 2c 2d 22 27 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 20 20 4c 0d 0a 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 27 20 20 20 20 5f 2e 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2d 2e 5f 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 20 7c 0d 0a 20 20 2c 60 2d 2e 20 20 20 20 2c 22 2e 20 20 20 60 2d 2d 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 3e 2e 20 20 20 20 20 20 2c 27 20 20 20 20 20 7c 0d 0a 20 2e 20 2e 27 5c 27 20 20 20 60 2d 27 20 20 20 20 20 20 20 5f 5f 20 20 20 20 2c 20 20 2c 2d 2e 20 20 20 20 20 20 20 20 20 2f 20 20 60 2e 5f 5f 2e 2d 20 20 20 20 20 20 2c 27 0d 0a 20 7c 7c 3a 2c 20 2e 20 20 20 20 20 20 20 20 20 20 20 2c 27 20 20 3b 20 20 2f 20 20 2f 20 5c 20 60 20 20 20 20 20 20 20 20 60 2e 20 20 20 20 2e 20 20 20 20 20 20 2e 27 2f 0d 0a 20 6a 7c 3a 44 20 20 5c 20 20 20 20 20 20 20 20 20 20 60 2d 2d 27 20 20 27 20 2c 27 5f 20 20 2e 20 2e 20 20 20 20 20 20 20 20 20 60 2e 5f 5f 2c 20 5c 20 20 20 2c 20 2f 0d 0a 2f 20 4c 3a 5f 20 20 7c 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 22 27 20 3a 5f 3b 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 2e 27 2e 27 0d 0a 2e 20 20 20 20 22 22 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 22 22 22 22 22 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 56 0d 0a 20 60 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 20 20 60 2e 20 20 20 5f 2c 2e 2e 20 20 60 0d 0a 20 20 20 60 2c 5f 20 20 20 2e 20 20 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5f 2c 2d 27 2f 20 20 20 20 2e 2e 20 60 2c 27 20 20 20 5f 5f 20 20 60 0d 0a 20 20 20 20 29 20 5c 60 2e 5f 20 20 20 20 20 20 20 20 5f 5f 5f 2e 2e 2e 2e 2d 2d 2d 2d 22 27 20 20 2c 27 20 20 20 2e 27 20 20 5c 20 7c 20 20 20 27 20 20 5c 20 20 2e 0d 0a 20 20 20 2f 20 20 20 60 2e 20 22 60 2d 2e 2d 2d 22 27 20 20 20 20 20 20 20 20 20 5f 2c 27 20 2c 27 20 20 20 20 20 60 2d 2d 2d 27 20 7c 20 20 20 20 60 2e 2f 20 20 7c 0d 0a 20 20 2e 20 20 20 5f 20 20 60 22 22 27 2d 2d 2e 2e 5f 5f 5f 5f 5f 2e 2e 2d 2d 22 20 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 20 20 27 20 20 20 20 20 20 20 20 20 7c 0d 0a 20 20 7c 20 2e 22 20 60 2e 20 60 2d 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 2d 2e 20 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 20 20 20 20 20 20 20 2c 0d 0a 20 20 7c 20 60 2e 5f 2e 27 20 20 20 20 60 2c 5f 20 20 20 20 20 20 20 20 20 20 20 20 3b 20 20 2f 20 20 20 20 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 2e 0d 0a 20 2e 27 20 20 20 20 20 20 20 20 20 20 2f 7c 20 60 2d 2e 20 20 20 20 20 20 20 20 2e 20 2c 27 20 20 20 20 20 20 20 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 2c 0d 0a 20 27 2d 2e 5f 5f 20 5f 5f 20 5f 2c 27 2c 27 20 20 20 20 27 60 2d 2e 2e 5f 5f 5f 3b 2d 2e 2e 2e 5f 5f 20 20 20 2c 2e 27 5c 20 5f 5f 5f 5f 2e 5f 5f 5f 2e 27 0d 0a 20 60 22 5e 2d 2d 27 2e 2e 27 20 20 20 27 2d 60 2d 5e 2d 27 22 2d 2d 20 20 20 20 60 2d 5e 2d 27 60 2e 27 27 22 22 22 22 22 60 2e 2c 5e 2e 60 2e 2d 2d 27" | xxd -r -p

    cat << EOF


Usage: $0 [OPTION] ...

Options:
  Help: $0 --help
    -h, --help              Show this help menu for commands.

  Direct: $0 --direct [URL] || [DIR]
          e.g. $0 -d https://example.com/file.csv -s -c 2 -R
          e.g. $0 -d /home/user/file.csv -f Pikachu -c 2 -A 10 -o -r
    -d, --direct [URL] || [DIR]
                            Read a CSV File from the given URL. 
                            By default uses the pokemon dataset.
  Info: $0 --info
    -i, --info              Display a summary of information about the dataset.
  
  Sort: $0 --sort -c [NUM] -R
        e.g. $0 -s -c 2 -R
    -s, --sort              Sort the dataset.
        -c, --column [NUM]  Sort by the specified column number.
        -R, --reverse       Sort in reverse order.
  
  Find: $0 --find [STR] -c [NUM] -A [NUM] -o [TYPE]
        e.g. $0 -f Pikachu -c 2 -A 10 -o -r
    -f, --find [STR]        Search for values in a specific column.
                            By default, searches every column and outputs only 10 results. 
                            of the matching pattern.
        -c, --column [NUM]  Choose the column to search.
        -A, --amount [NUM]  Limit the number of results.
            -E, --every     Output every match.
        -o, --output        Specify output format:
            -r, --row       Output entire row containing the match.
            -f, --focused   Output only the exact match.
    -e, --easter-egg        Display an easter egg message.
                            Please try me :(
EOF
}

# Just a banter message
archaic_message() {
	echo -e "By thy will, thou hast settled upon $COMMAND \bedict!"
	echo -e "Thus, thine behest shall be mine ordinance!\n"
}

error_general(){
	echo "Try using -h or --help for help menu"
}

error_direct(){
	echo "Try inserting a proper [URL]/[DIRECTORY]"
	echo "e.g. -d https://example.com/file.csv"
	echo "e.g. -d /home/user/file.csv"
}

error_find(){
	echo "Try inserting a proper string [STR]"
	echo "e.g. -f Pikachu"
}

error_column(){
	echo "Try inserting a proper number [NUM]"
	echo "e.g. -c 2"
}

error_amount(){
	echo "Try inserting a proper number [NUM]"
	echo "e.g. -A 10"
}

error_output(){
	echo "Try using -r or --row for output type"
	echo "Try using -f or --focused for output type"
}

csv_dir_check(){
	local temp="$1"
	if [[ "$temp" == *.csv ]]; then
		return 0
	else
		return 1
	fi
}

valid_url() {
    local url="$1"
    if curl --output /dev/null --silent --head --fail "$url"; then
        return 0  # URL is valid
    else
        return 1  # URL is not valid
    fi
}

csv_link_check(){
	local temp="$1"
	if echo "$temp" | head -n 5 | grep -q ','; then
		return 0
	else
		return 1
	fi
}

error_csv(){
	echo "File is not a CSV file"
	echo "Try inserting a proper CSV file"
	echo "e.g. -d https://example.com/file.csv"
	echo "e.g. -d /home/user/file.csv"
}

is_integer() {
    local s="$1"
    [[ "$s" =~ ^[0-9]+$ ]]
}

# checking for arguments
while [ $# -gt 0 ]; do
	case $1 in
		-h|--help)
			help_menu
			exit 0
			;;
		-d|--direct)
			if [ -e "$2" ]; then
				if csv_dir_check "$2"; then
					CSV_FILE=$(cat "$2")
					shift 2
				else
					error_csv
					exit 1
				fi
			else 
				if valid_url "$2"; then # still can't be used
					if csv_link_check "$2"; then
						CSV_LINK="$2"
					else 
						error_csv
						exit 1
					fi
				else 
					error_direct
					exit 1
				fi
			fi
			;;
		-i|--info)
			COMMAND+="Erudition "
			INFO_CHECK=1
			break
			;;
		-s|--sort)
			COMMAND+="Dispoition "
			SORT_CHECK=1
			SORT_OUTPUT=1
			case $2 in
				-c|--column)
					if ! is_integer "$3" || [ "$3" -le 0 ]; then
						error_column
						exit 1
					fi
					SORT_COLUMN=$3
					if [ $4 == "-R" ] || [ $4 == "--reverse" ]; then
						SORT_ORDER=1 # descending
						shift 4
					else 
						shift 3
					fi
					;;
				-R|--reverse)
					SORT_ORDER=1
					if [ $3 == "-c" ] || [ $3 == "--column" ]; then
						if ! is_integer "$4" || [ "$4" -le 0 ]; then
							error_column
							exit 1
						fi
						SORT_COLUMN=$4
						shift 4
					else 
						shift 2
					fi
					;;
				*)
					shift
					;;
			esac
			;;
		-f|--find)
			if [ -z "$2" ]; then
				error_find
				exit 1
			fi
			FIND_CHECK=1
			FIND_VALUE=$2
			COMMAND+="Inquisition "
			case $3 in
				-c|--column)
					if ! is_integer "$4" || [ "$4" -le 0 ]; then
						error_column
						exit 1
					fi
					FIND_COLUMN=$4
					case $5 in
						-A|--amount)
							if ! is_integer "$4" || [ "$4" -le 0 ] || [ "$4" == "-E" ] || [ "$4" == "--every" ]; then
								error_amount
								exit 1
							fi
							FIND_AMOUNT=$6
							if [ $7 == "-o" ] || [ $7 == "--output" ]; then
								if [ $8 == "-r" ] || [ $8 == "--row" ] ||  [ $8 == "-f" ] || [ $8 == "--focused" ]; then
									OUTPUT_TYPE=$8
									shift 8
								else
									echo "Invalid argument: $8"
									error_output
									exit 1
								fi
							else
								shift 6
							fi
							;;
						-o|--output)
							if [ $6 == "-r" ] || [ $6 == "--row" ] ||  [ $6 == "-f" ] || [ $6 == "--focused" ]; then
								OUTPUT_TYPE=$6
								if [ $7 == "-A" ] || [ $7 == "--amount" ]; then
									if ! is_integer "$4" || [ "$4" -le 0 ] || [ "$4" == "-E" ] || [ "$4" == "--every" ]; then
										error_amount
										exit 1
									fi
									FIND_AMOUNT=$8
									shift 8
								else
									shift 6
								fi
							else
								echo "Invalid argument: $6"
								error_output
								exit 1
							fi
							;;
						*)
							shift 4
							;;
					esac
					;;
				-A|--amount)
					if ! is_integer "$4" || [ "$4" -le 0 ] || [ "$4" == "-E" ] || [ "$4" == "--every" ]; then
						error_amount
						exit 1
					fi
					FIND_AMOUNT=$4
					case $5 in
						-o|--output)
							if [ $6 == "-r" ] || [ $6 == "--row" ] ||  [ $6 == "-f" ] || [ $6 == "--focused" ]; then
								OUTPUT_TYPE=$6
								if [ $7 == "-c" ] || [ $7 == "--column" ]; then
									if ! is_integer "$8" || [ "$8" -le 0 ]; then
										error_column
										exit 1
									fi
									FIND_COLUMN=$8
									shift 8
								else
									shift 6
								fi
							else
								echo "Invalid argument: $6"
								error_output
								exit 1
							fi
							;;
						-c|--column)
							if ! is_integer "$6" || [ "$6" -le 0 ]; then
								error_column
								exit 1
							fi
							FIND_COLUMN=$6
							if [ $7 == "-o" ] || [ $7 == "--output" ]; then
								if [ $8 == "-r" ] || [ $8 == "--row" ] ||  [ $8 == "-f" ] || [ $8 == "--focused" ]; then
									OUTPUT_TYPE=$8
									shift 8
								else
									echo "Invalid argument: $8"
									error_output
									exit 1
								fi
							else
								shift 6
							fi
							;;
						*)
							shift 4
							;;
					esac
					;;
				-o|--output)
					if [ $4 == "-r" ] || [ $4 == "--row" ] ||  [ $4 == "-f" ] || [ $4 == "--focused" ]; then
						OUTPUT_TYPE=$4
						case $5 in
							-c|--column)
								if ! is_integer "$6" || [ "$6" -le 0 ]; then
									error_column
									exit 1
								fi
								FIND_COLUMN=$6
								if [ $7 == "-A" ] || [ $7 == "--amount" ]; then
									if ! is_integer "$4" || [ "$4" -le 0 ] || [ "$4" == "-E" ] || [ "$4" == "--every" ]; then
										error_amount
										exit 1
									fi
									FIND_AMOUNT=$8
									shift 8
								else
									shift 6
								fi
								;;
							-A|--amount)
								if ! is_integer "$4" || [ "$4" -le 0 ] || [ "$4" == "-E" ] || [ "$4" == "--every" ]; then
									error_amount
									exit 1
								fi
								FIND_AMOUNT=$6
								if [ $7 == "-c" ] || [ $7 == "--column" ]; then
									if ! is_integer "$8" || [ "$8" -le 0 ]; then
										error_column
										exit 1
									fi
									FIND_COLUMN=$8
									shift 8
								else
									shift 6
								fi
								;;
							*)
								shift 4
								;;
						esac
					else
						echo "Invalid argument: $4"
						error_output
						exit 1
					fi
					;;
				*)
					shift 2
					;;
			esac
			;;
		-e|--easter-egg)
			easter_egg # please try me :(
			shift
			;;
		*)
			echo "Invalid argument: $1"
			echo "Pray, what manner of contraption is this?"
			echo "I must confess, I find myself somewhat perplexed."
			echo "Could it be that your vision is, perchance, somewhat obscured?"
			echo "For, if I recall correctly, I did impart a most clear and unambiguous instruction."
			echo "Surely, it was not so easily forgotten?"
			exit 1
			;;
	esac
done

# read the dataset 
if [ $CSV_DIR -eq 0 ]; then
	CSV_FILE=$(curl -s -L "$CSV_LINK")
fi

CSV_HEADER=$(echo "$CSV_FILE" | head -n 1)
CSV_TAIL=$(echo "$CSV_FILE" | tail -n +2)

# output archaic message
archaic_message

if [ $INFO_CHECK -eq 1 ]; then
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

# sort the dataset
if [ $SORT_CHECK -eq 1 ]; then
	if [ $SORT_ORDER -eq 0 ]; then # ascending
		CSV_FILE=$(echo "$CSV_FILE" | sort -t, -nk$SORT_COLUMN) 
	elif [ $SORT_ORDER -eq 1 ]; then # descending
		CSV_FILE=$(echo "$CSV_FILE" | sort -t, -nrk$SORT_COLUMN)
	fi
fi

# find pattern in the dataset
if [ $FIND_CHECK -eq 1 ]; then
	if [ $SORT_OUTPUT -eq 1 ]; then
		SORT_OUTPUT=0 # disable sort output
	fi
	if [ $FIND_AMOUNT == "-E" ] || [ $FIND_AMOUNT == "--every" ]; then
		if [ $OUTPUT_TYPE == "-r" ] || [ $OUTPUT_TYPE == "--row" ]; then
			CSV_TAIL=$(echo "$CSV_FILE" | awk -F, -v col="$FIND_COLUMN" -v val="$FIND_VALUE" '
				$col ~ val {
					print $0;
				}
			')
			echo "$CSV_HEADER"
			echo "$CSV_TAIL"
		elif [ $OUTPUT_TYPE == "-f" ] || [ $OUTPUT_TYPE == "--focused" ]; then
			CSV_TAIL=$(echo "$CSV_TAIL" | awk -F, -v col="$FIND_COLUMN" -v val="$FIND_VALUE" '
				$col ~ val {
					print $0;
				}
			')
			echo "$CSV_TAIL" | grep -o "$FIND_VALUE" 
			echo -n "The amount of occurrences of the focused value is1: "
			echo "$CSV_TAIL" | grep -o "$FIND_VALUE" | wc -l
		fi
	elif [ $OUTPUT_TYPE == "-r" ] || [ $OUTPUT_TYPE == "--row" ]; then
		CSV_TAIL=$(echo "$CSV_TAIL" | awk -F, -v col="$FIND_COLUMN" -v val="$FIND_VALUE" -v amt="$FIND_AMOUNT" '
            amt > 0 && $col ~ val {
                print $0;
                amt--;
            }
        ')
		echo "$CSV_HEADER"
		echo "$CSV_TAIL"
	elif [ $OUTPUT_TYPE == "-f" ] || [ $OUTPUT_TYPE == "--focused" ]; then
		CSV_TAIL=$(echo "$CSV_TAIL" | awk -F, -v col="$FIND_COLUMN" -v val="$FIND_VALUE" -v amt="$FIND_AMOUNT" '
            amt > 0 && $col ~ val {
                print $0;
                amt--;
            }
        ')
		echo "$CSV_TAIL" | grep -o "$FIND_VALUE" 
		echo -n "The amount of occurrences of the focused value is2: "
		echo "$CSV_TAIL" | grep -o "$FIND_VALUE" | wc -l
	fi
fi

# output the sorted dataset
if [ $SORT_OUTPUT -eq 1 ]; then
	echo "$CSV_HEADER"
	echo "$CSV_TAIL"
fi

# don bang