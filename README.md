# Sisop-1-2025-IT05

## A. Repo Structure Setup

This is simply done by using the `mkdir` and `touch` command. 

Here is the following command we used: 

```bash
$ mkdir -p soal_1 soal_2/scripts soal_3 soal_4 && touch ./soal_1/poppo_siroyo.sh ./soal_2/login.sh ./soal_2/register.sh ./soal_2/scripts/core_monitor.sh ./soal_2/scripts/frag_monitor.sh ./soal_2/scripts/manager.sh ./soal_2/terminal.sh ./soal_3/dsotm.sh ./soal_4/pokemon_analysis.sh

```

## B. Local Repo Setup

### 1. Clone Remote Repository

We can clone the remote repo to our local repo by using the [HTTPS Link](https://github.com/zelebwr/Sisop-1-2025-IT05.git) or the [SSH Link](git@github.com:zelebwr/Sisop-1-2025-IT05.git) and then simply use the following command:

```bash
$ git clone <link>
```

### 2. Enable All File's Run Permission

We can easily enable the run permission on every file by using the -R (recursive) flag after moving to the local repo in our device. Do this command when met with **Running** permission problem:

```bash
$ chmod -R +x .
```

## C. Challenge Operation

### Soal 1 – Hemsworth Needs Attention

### Soal 2 – Game Kece

### Soal 3 – CLI UI/UX Gacor

### Soal 4 – Main Pokemon Malah Pusing Sendiri

#### Declare Shell Environment


### dsotm.sh

> dsotm.sh is a Bash script containing five tracks from The Dark Side of the Moon, each producing different terminal outputs. When executed, the script first clears the terminal to ensure that its effects are displayed correctly without interference.
>  The script must be run using the following format:
```
./dsotm.sh --play=”<Track>"
 ``` 

> where **<Track>** represents one of the selected song names. This is required for the script to function properly.

``` 
#!/bin/bash
```
is called a shebang. It tells the system to execute the script using the Bash shell

```
clear
```
Clears the terminal before running the script to ensure a clean display.
```
if [[ "$1" =~ ^--play= ]]; then 
    TRACK="${1#--play=}"
```
Checks if the first argument matches the expected format, then assigns it to the ```TRACK``` variable.
``` 
case "$TRACK" in
```
Uses ``` case ``` to determine the action based on the selected song.
### 1. Track : Speak to Me 
> Mode Details: Displays given affirmation quotes with terminal effects`
```
curl -s https://raw.githubusercontent.com/annthurium/affirmations/refs/heads/main/affirmations.js | sed '1d;$d' | tr -d '",;]' | while IFS= read -r line; do
    echo "$line"
    sleep 1
done
```
Fetches data from the Affirmations API and removes the first and last lines and unnecessary characters from the API response 
The loop prints each affirmation with a 1-second delay.

### 2. Track : On the Run
>  Mode Details : Displays a loading animation with a progress bar

```
while [ $PROGRESS -lt 100 ]; do
    sleep $(awk 'BEGIN{srand(); print 0.1 + rand()*0.9}')
    printf "\r[%-*s] %d%%" "$BAR_LENGTH" "$(head -c $((BAR_LENGTH * PROGRESS / 100)) < /dev/zero | tr '\0' '#')" "$PROGRESS"
    PROGRESS=$((PROGRESS + (RANDOM % 10) + 1))
    [ $PROGRESS -gt 100 ] && PROGRESS=100
done
```
Creates a while loop that runs while ```PROGRESS``` is less than 100%, with a random delay between 0.1 and 1 second. Each progress step is updated with a random value, ensuring the progress bar reaches exactly 100% at the end.
```printf``` is used to display a progress bar.

### 3. Track : Time
>  Mode Details : Real-Time Clock with Cron Job
```
if crontab -l | grep -q "$SCRIPT_PATH --play=\"Time\""; then
    echo "Cron job already exists."
else
    (crontab -l 2>/dev/null; echo "* * * * * $SCRIPT_PATH --play=\"Time\"") | crontab -
    echo "Cron job successfully added."
fi

while true; do
    clear
    echo "⏳ REAL-TIME CLOCK ⏳"
    echo "----------------------"
    date +"%Y-%m-%d %H:%M:%S"
    sleep 1
```
Checks if a cron job for the script already exists.
 If not, it adds a new cron job to run every minute.

The loop continuously updates and displays the current time.

### 4. Track : Money
>  Mode Details : Displays a "rain" effect of currency symbols in the terminal, similar to cmatrix but with currency symbols ($, €, £, ¥, etc.)

```
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
```
```symbols=( "$" "€" "£" "¥" "¢" "₹" "₩" "₿" "₣" )``` List of currency symbols.

```cols=$(tput cols)``` Gets the number of columns in the terminal.

```heights[i]=$(( RANDOM % 5 + 1 ))``` Randomizes the height of falling symbols per column.

```while true; do``` Infinite loop for continuously displaying symbol, then Randomly decides whether to show a symbol in a column. Also Randomly assigns purple (35) or white (37) color.

```sleep 0.1``` Slows down the effect for a smoother animation

### 5. Track : Brain Damage
>  Mode Details : Displays a list of system processes, functioning like a simplified task manager, updating every second
```
 while true; do
        clear

         echo -e "\e[1;31m========================== B R A I N  D A M A G E ==========================\e[0m\n"
         echo -e "\e[1;31mPID         USER            PR      NI        CPU%       MEM%       COMMAND\e[0m"
         echo -e "\e[1;31m----------------------------------------------------------------------------\e[0m"

        top -b -n 1 -o %CPU | awk 'NR>7 {
                if (NR % 2 == 0)
                printf "\033[1;37m%-12s %-15s %-7s %-7s %-10s %-10s %-s\033[0m\n", $1, $2, $3, $4, $9, $10, $12;
                else
                    printf "\033[38;5;250m%-12s %-15s %-7s %-7s %-10s %-10s %-s\033[0m\n", $1, $2, $3, $4, $9, $10, $12;
        }' | head -n 10

        sleep 1
        done
```
Clears the terminal before each update.
Displays a formatted table with PID, USER, Priority, CPU%, MEM%, and Command.
Updates every second to reflect live system changes.
Alternates row colors for better readability.

#### Before Revision
```
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
```
```while true; do``` Infinite loop for continuously updating the process list.
  Retrieves the top 10 CPU-intensive processes.

Color Formatting: white for even rows and light blue for odd rows.

```sleep 1``` Refreshes the display every second.

```clear``` Clears the screen before printing new data.
done
	;;
```
        *)
            echo "Error."
            ;;
    esac
else
	echo "Use: ./dsotm.sh --play=\"Song Name\""
fi
```
```echo "Error." ``` Displays an error message if the input is invalid. 

```echo "Use: ./dsotm.sh --play=\"Song Name\""```  Provides the correct usage instructions to the user.If the initial condition is not met (invalid argument).

