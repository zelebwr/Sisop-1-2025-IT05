#!/bin/bash

clear

if [[ "$1" =~ ^--play= ]]; then
    TRACK="${1#--play=}"

    case "$TRACK" in
        "Speak to Me")
		echo -e "\e[1;35m====================================\e[0m"
		echo -e "\e[1;36m         NOW PLAYING:              \e[0m"
		echo -e "\e[1;32m        🎵 Speak to Me 🎵         \e[0m"
		echo -e "\e[1;35m====================================\e[0m"
		echo ""

            curl -s https://raw.githubusercontent.com/annthurium/affirmations/refs/heads/main/affirmations.js | sed '1d;$d' | tr -d '",;]' | while IFS= read -r line; do
        	echo "$line"
                sleep 1
            done
            ;;

	"On the Run")
	echo -e "\e[1;35m███████████████████████████████████\e[0m"
	echo -e "\e[1;35m█   \e[1;33m NOW LOADING...\e[1;35m   █\e[0m"
	echo -e "\e[1;35m█    \e[1;36m🎵 On the Run 🎵\e[1;35m    █\e[0m"
	echo -e "\e[1;35m███████████████████████████████████\e[0m"
	echo -ne "\e[1;34m🏃 Starting Run"
	echo""
	WIDTH=$(tput cols)
	BAR_LENGTH=$((WIDTH - 10))
	PROGRESS=0

	while [ $PROGRESS -lt 100 ]; do
	 sleep $(awk 'BEGIN{srand(); print 0.1 + rand()*0.9}')
	printf "\r[%-*s] %d%%" "$BAR_LENGTH" "$(head -c $((BAR_LENGTH * PROGRESS / 100)) < /dev/zero | tr '\0' '#')" "$PROGRESS"
	PROGRESS=$((PROGRESS + (RANDOM % 10) + 1))
	[ $PROGRESS -gt 100 ] && PROGRESS=100
	done

	printf "\r[%-*s] 100%%\n" "$BAR_LENGTH" "$(head -c $BAR_LENGTH < /dev/zero | tr '\0' '#')"
    	echo ""

	echo -e "\e[1;35m███████████████████████████████████\e[0m"
	echo -e "\e[1;35m█    \e[1;32m LOADING COMPLETED! \e[1;35m     █\e[0m"
	echo -e "\e[1;35m███████████████████████████████████\e[0m"
            ;;

        "Time")
            SCRIPT_PATH="$(realpath "$0")"

            if crontab -l | grep -q "$SCRIPT_PATH --play=\"Time\""; then
                echo "Cron job sudah ada."
            else
                (crontab -l 2>/dev/null; echo "* * * * * $SCRIPT_PATH --play=\"Time\"") | crontab -
                echo "Cron job berhasil ditambahkan."
            fi

            while true; do
                clear
		echo "⏳ REAL-TIME CLOCK ⏳"
                echo "----------------------"
		date +"%Y-%m-%d %H:%M:%S"
                sleep 1
            done
            ;;

        "Money")

	symbols=( "$" "€" "£" "¥" "¢" "₹" "₩" "₿" "₣" )

	cols=$(tput cols)

	heights=()
	for (( i=0; i<$cols; i++ )); do
	    heights[i]=$(( RANDOM % 5 + 1 ))
	done

		while true; do
	    line=""
	    for (( i=0; i<$cols; i++ )); do
	        if (( RANDOM % heights[i] == 0 )); then
	            if (( RANDOM % 2 == 0 )); then
	                color="\e[35m"
	            else
	                color="\e[37m"
	            fi
	            line+="$color${symbols[RANDOM % ${#symbols[@]}]} \e[0m"
	        else
            line+="  " 
	        fi
	    done
	    echo -e "$line"
	    sleep 0.1
	done
	;;
	"Brain Damage")
		while true; do
	echo -e "\e[1;37m=== Brain Damage ===\e[0m"
    	echo ""

	ps aux --sort=-%cpu | awk 'NR<=11' | awk '{
        if (NR % 2 == 0) 
            print "\033[1;37m" $0 "\033[0m";
        else
            print "\033[38;5;110m" $0 "\033[0m";
    }'

    	sleep 1
    	clear

	done
	;;

        *)
            echo "Error."
            ;;
    esac
else
    echo "Us
e: ./dsotm.sh --play=\"Song Name\""
fi
