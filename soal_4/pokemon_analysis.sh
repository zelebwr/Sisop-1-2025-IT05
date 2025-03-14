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
CSV_FILE=$(curl -s -L "https://drive.usercontent.google.com/u/0/uc?id=1n-2n_ZOTMleqa8qZ2nB8ALAbGFyN4-LJ&export=download")

# Display help menu
help_menu() {
	echo "09 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5f 2c 2e 2d 2d 2d 2d 2d 2d 2e 2e 2e 2e 5f 5f 5f 2c 2e 27 20 27 2c 2e 2d 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2c 2d 27 20 20 20 20 20 20 20 20 20 20 5f 2c 2e 2d 2d 22 20 20 20 20 20 20 20 20 7c 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 5f 2e 2d 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 2c 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 20 2f 20 20 20 20 20 2f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 60 2e 0d 0a 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 7c 20 20 20 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 2e 5c 0d 0a 20 20 20 20 20 20 20 5f 5f 5f 5f 20 20 20 20 20 20 7c 5f 5f 5f 2e 5f 2e 20 20 7c 20 20 20 20 20 20 20 5f 5f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 20 60 2e 0d 0a 20 20 20 20 20 2e 27 20 20 20 20 60 2d 2d 2d 22 22 20 20 20 20 20 20 20 60 60 22 2d 2e 2d 2d 22 27 60 20 20 5c 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 5c 0d 0a 20 20 20 20 2e 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 20 5f 5f 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 20 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 20 2e 0d 0a 20 20 20 20 60 2c 27 20 20 20 20 20 20 20 20 20 2c 2d 22 27 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5c 20 20 20 20 20 20 20 20 20 20 20 20 20 7c 20 20 20 20 4c 0d 0a 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 27 20 20 20 20 5f 2e 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2d 2e 5f 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 20 7c 0d 0a 20 20 2c 60 2d 2e 20 20 20 20 2c 22 2e 20 20 20 60 2d 2d 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 3e 2e 20 20 20 20 20 20 2c 27 20 20 20 20 20 7c 0d 0a 20 2e 20 2e 27 5c 27 20 20 20 60 2d 27 20 20 20 20 20 20 20 5f 5f 20 20 20 20 2c 20 20 2c 2d 2e 20 20 20 20 20 20 20 20 20 2f 20 20 60 2e 5f 5f 2e 2d 20 20 20 20 20 20 2c 27 0d 0a 20 7c 7c 3a 2c 20 2e 20 20 20 20 20 20 20 20 20 20 20 2c 27 20 20 3b 20 20 2f 20 20 2f 20 5c 20 60 20 20 20 20 20 20 20 20 60 2e 20 20 20 20 2e 20 20 20 20 20 20 2e 27 2f 0d 0a 20 6a 7c 3a 44 20 20 5c 20 20 20 20 20 20 20 20 20 20 60 2d 2d 27 20 20 27 20 2c 27 5f 20 20 2e 20 2e 20 20 20 20 20 20 20 20 20 60 2e 5f 5f 2c 20 5c 20 20 20 2c 20 2f 0d 0a 2f 20 4c 3a 5f 20 20 7c 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 22 27 20 3a 5f 3b 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 60 2e 27 2e 27 0d 0a 2e 20 20 20 20 22 22 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 22 22 22 22 22 27 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 56 0d 0a 20 60 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2e 20 20 20 20 60 2e 20 20 20 5f 2c 2e 2e 20 20 60 0d 0a 20 20 20 60 2c 5f 20 20 20 2e 20 20 20 20 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 5f 2c 2d 27 2f 20 20 20 20 2e 2e 20 60 2c 27 20 20 20 5f 5f 20 20 60 0d 0a 20 20 20 20 29 20 5c 60 2e 5f 20 20 20 20 20 20 20 20 5f 5f 5f 2e 2e 2e 2e 2d 2d 2d 2d 22 27 20 20 2c 27 20 20 20 2e 27 20 20 5c 20 7c 20 20 20 27 20 20 5c 20 20 2e 0d 0a 20 20 20 2f 20 20 20 60 2e 20 22 60 2d 2e 2d 2d 22 27 20 20 20 20 20 20 20 20 20 5f 2c 27 20 2c 27 20 20 20 20 20 60 2d 2d 2d 27 20 7c 20 20 20 20 60 2e 2f 20 20 7c 0d 0a 20 20 2e 20 20 20 5f 20 20 60 22 22 27 2d 2d 2e 2e 5f 5f 5f 5f 5f 2e 2e 2d 2d 22 20 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 20 20 27 20 20 20 20 20 20 20 20 20 7c 0d 0a 20 20 7c 20 2e 22 20 60 2e 20 60 2d 2e 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 2f 2d 2e 20 20 20 20 20 20 20 20 20 20 20 2f 20 20 20 20 20 20 20 20 20 20 2c 0d 0a 20 20 7c 20 60 2e 5f 2e 27 20 20 20 20 60 2c 5f 20 20 20 20 20 20 20 20 20 20 20 20 3b 20 20 2f 20 20 20 20 20 20 20 20 20 2c 27 20 20 20 20 20 20 20 20 20 20 2e 0d 0a 20 2e 27 20 20 20 20 20 20 20 20 20 20 2f 7c 20 60 2d 2e 20 20 20 20 20 20 20 20 2e 20 2c 27 20 20 20 20 20 20 20 20 20 2c 20 20 20 20 20 20 20 20 20 20 20 2c 0d 0a 20 27 2d 2e 5f 5f 20 5f 5f 20 5f 2c 27 2c 27 20 20 20 20 27 60 2d 2e 2e 5f 5f 5f 3b 2d 2e 2e 2e 5f 5f 20 20 20 2c 2e 27 5c 20 5f 5f 5f 5f 2e 5f 5f 5f 2e 27 0d 0a 20 60 22 5e 2d 2d 27 2e 2e 27 20 20 20 27 2d 60 2d 5e 2d 27 22 2d 2d 20 20 20 20 60 2d 5e 2d 27 60 2e 27 27 22 22 22 22 22 60 2e 2c 5e 2e 60 2e 2d 2d 27" | xxd -r -p

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
                            By default, searches every column and outputs all 
                            of the matching pattern.
        -c, --column [NUM]  Choose the column to search.
        -A, --amount [NUM]  Limit the number of results.
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

# summary of the dataset
SUMMARY=$(echo "$CSV_FILE" | awk -F, '
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
)

error_general(){
	echo "Try using -h or --help for help menu"
}

erorr_direct(){
	echo "Try inserting a proper URL/DIRECTORY [URL] [DIR]"
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

# checking for arguments
while [ $# -gt 0 ] do
	case $1 in
		-h|--help)
			help_menu
			exit 0
			;;
		-d|--direct)
			CSV_FILE=$(curl -s -L $2)
			shift 2
			;;
		-i|--info)
			COMMAND+="Erudition "
			archaic_message
			echo "$SUMMARY"
			exit 0
			;;
		-s|--sort)
			COMMAND+="Dispoition "
			SORT_CHECK=1
			SORT_OUTPUT=1
			case $2 in
				-c|--column)
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
			FIND_CHECK=1
			FIND_VALUE=$2
			COMMAND+="Inquisition "
			case $3 in
				-c|--column)
					FIND_COLUMN=$4
					case $5 in
						-A|--amount)
							FIND_AMOUNT=$6
							if [ $7 == "-o" ] || [ $7 == "--output" ]; then
								if [ $8 == "-r" ] || [ $8 == "--row" ] ||  [ $8 == "-f" ] || [ $8 == "--focused" ]; then
									OUTPUT_TYPE=$8
									shift 8
else
									echo "Invalid argument: $8"
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
									FIND_AMOUNT=$8
									shift 8
								else
									echo "Invalid argument: $8"
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
									FIND_AMOUNT=$8
									shift 8
								else
								fi
							else
								echo "Invalid argument: $6"
								exit 1
	shift 6
								fi
							else
								echo "Invalid argument: $6"
								exit 1
							fi
							;;
						*)
							shift 4
							;;
					esac
					;;
				-A|--amount)
					FIND_AMOUNT=$4
					case $5 in
						-o|--output)
							if [ $6 == "-r" ] || [ $6 == "--row" ] ||  [ $6 == "-f" ] || [ $6 == "--focused" ]; then
								OUTPUT_TYPE=$6
								if [ $7 == "-c" ] || [ $7 == "--column" ]; then
									FIND_COLUMN=$8
									shift 8
								else
									shift 6
								fi
							else
								echo "Invalid argument: $6"
								exit 1
							fi
							;;
						-c|--column)
							FIND_COLUMN=$6
							if [ $7 == "-o" ] || [ $7 == "--output" ]; then
								if [ $8 == "-r" ] || [ $8 == "--row" ] ||  [ $8 == "-f" ] || [ $8 == "--focused" ]; then
									OUTPUT_TYPE=$8
									shift 8
								else
									echo "Invalid argument: $8"
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
								FIND_COLUMN=$6
								if [ $7 == "-A" ] || [ $7 == "--amount" ]; then
									FIND_AMOUNT=$8
									shift 8
								else
									shift 6
								fi
								;;
							-A|--amount)
								FIND_AMOUNT=$6
								if [ $7 == "-c" ] || [ $7 == "--column" ]; then
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
						exit 1
					fi
					;;
				*)
					shift 2
					;;
			esac
			;;
		-e|--easter-egg)
			easter_egg
			shift
			;;
		*)
			echo "Invalid argument: $1"
			exit 1
			;;
	esac
done

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
	if [ $OUTPUT_TYPE == "-r" ] || [ $OUTPUT_TYPE == "--row" ]; then
		CSV_FILE=$(echo "$CSV_FILE" | awk -F, -v col=$FIND_COLUMN -v val=$FIND_VALUE -v amt=$FIND_AMOUNT -'{
			while (amt > 0 && $col ~ val) {
				print $0;
				amt--;
			}
		}')
		echo "$CSV_FILE"
	elif [ $OUTPUT_TYPE == "-f" ] || [ $OUTPUT_TYPE == "--focused" ]; then
		CSV_FILE=$(echo "$CSV_FILE" | awk -F, -v col=$FIND_COLUMN -v val=$FIND_VALUE -v amt=$FIND_AMOUNT -'{
			while (amt > 0 && $col ~ val) {
				print $0;
				amt--;
			}
		}')
		echo "$CSV_FILE" | grep -o "$FIND_VALUE" 
		echo "The amount of occurrences of the focused value is: "
		echo "$CSV_FILE" | grep -o "$FIND_VALUE" | wc -l
	fi
fi

# output the sorted dataset
if [ $SORT_OUTPUT -eq 1 ]; then
	archaic_message
	echo "$CSV_FILE"
fi