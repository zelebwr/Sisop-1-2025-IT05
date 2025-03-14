#!/bin/bash

easter_egg() {
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
    cat << EOF
Usage: $0 [OPTION] ... [FILE]

Options:
  -h, --help              Show this help menu for commands.

  -d, --direct [URL]||[DIR]
                          Read a CSV File from the given URL. 
                          By default uses the pokemon dataset.

  -i, --info              Display a summary of information about the dataset.

  -s, --sort              Sort the dataset.
      -c, --column [NUM]  Sort by the specified column number.
      -R, --reverse       Sort in reverse order.

  -f, --find [STR]        Search for values in a specific column.
                          By default, searches every column and outputs all 
                          of the matching pattern.
      -c, --column [NUM]  Choose the column to search.
      -A, --amount [NUM]  Limit the number of results.
      -o, --output        Specify output format:
          -r, --row       Output entire row containing the match.
          -f, --focused   Output only the exact match.
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

# checking for arguments
while [$# -gt 0] do
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
									shift 6
								fi
							else
								echo "Invalid argument: $6"
								exit 1
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
				*)
					shift 2
					;;
			esac
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