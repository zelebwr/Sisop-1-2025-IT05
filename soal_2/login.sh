#!/bin/bash

# pathings
SCRIPT_DIR=$(dirname "$(realpath "$0")")
DB_PATH_PLYR="$SCRIPT_DIR/data/player.csv"

# check if the database exists
if [ ! -e $DB_PATH_PLYR ]; then
    echo "Database not found. Please register first."
    echo "Run script register.sh to register" 
    exit 1
fi

# login
echo -e "\nLogin\n"

# login email
while true; do
    echo -n "Email: "
    read EMAIL
    if [ -z "$EMAIL" ]; then
        echo -e "\nEmail cannot be empty"
        echo -e "Please enter a valid email.\n"
    elif ! [[ "$EMAIL" =~ ^[A-Za-z0-9._%+-]+.*\.[a-zA-Z]{2,}$ ]]; then
        echo -e "\nEmail \"$EMAIL\" is not valid."
        echo -e "Email must contain \'@\' and \'.<domain>\'\n"
        echo -e "Please enter a valid email.\n"
    elif ! grep -q "$EMAIL" "$DB_PATH_PLYR"; then
        echo -e "\nEmail \"$EMAIL\" not found."
        echo -e "Please enter a valid email.\n"
    else
        break
    fi
done

# login password
while true; do
    echo -n "Password: "
    read -s PASSWORD
    if [ -z "$PASSWORD" ]; then
        echo -e "\nPassword cannot be empty"
        echo -e "Please enter a valid password.\n"
    elif [ ${#PASSWORD} -lt 8 ] || ! [[ "$PASSWORD" =~ [A-Z]+ ]] || ! [[ "$PASSWORD" =~ [a-z]+ ]] || ! [[ "$PASSWORD" =~ [0-9]+ ]]; then
            echo -e "\nPassword must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, and one number."
            echo -e "Please enter a valid password.\n"
    elif ! grep -q "$EMAIL.*$PASSWORD" "$DB_PATH_PLYR"; then
        echo -e "\nPassword is incorrect."
        echo -e "Please enter a valid password.\n"
    else
        break
    fi
done

# login attempt
USERNAME=$(awk -F, -v mail="$EMAIL" -v pass="$PASSWORD" '$1==mail && $3==pass {print $2}' "$DB_PATH_PLYR") 

if [ -z "$USERNAME" ]; then
    echo -e "\nLogin failed."
    echo -e "Please try again.\n"
else
    echo -e "\nLogin successful."
    echo -e "Welcome back, $USERNAME.\n"
fi
