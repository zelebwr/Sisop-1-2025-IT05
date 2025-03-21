#!/bin/bash

# pathings
SCRIPT_DIR=$(dirname "$(realpath "$0")")
echo "$SCRIPT_DIR" # script's directory
DB_PATH_PLYR="$SCRIPT_DIR/data/player.csv" #script's database's direcotry
DB_HEADER=$(echo -e "email,username,password\n")

# check if the database exists
if [ ! -e $DB_PATH_PLYR ]; then
    echo "Database not found. Creating a new one..." 
    mkdir -p $SCRIPT_DIR/data && touch $SCRIPT_DIR/data/player.csv
    if [ $? -ne 0 ]; then
        echo "Failed to create database. Exiting..."
        exit 1
    else
        echo "Database created successfully."
        echo "Setting up database header..."
        echo "$DB_HEADER" > $DB_PATH_PLYR
        if [ $? -ne 0 ]; then
            echo "Failed to set up database header. Exiting..."
            exit 1
        else
            echo "Database header set up successfully."
        fi
    fi
else 
    CURRENT_HEADER=$(head -n 1 $DB_PATH_PLYR)
    if [ "$CURRENT_HEADER" != "$DB_HEADER" ]; then
        echo "Database header mismatch."
        echo "Setting up database headeer..."
        echo "$DB_HEADER" > $DB_PATH_PLYR
        if [ $? -ne 0 ]; then
            echo "Failed to set up database header. Exiting..."
            exit 1
        else
            echo "Database header set up successfully."
        fi
    fi
fi

# register
echo -e "\nRegister new player\n"

# register username
while true; do
    echo -n "Username: "
    read USERNAME
    if [ -z "$USERNAME" ]; then
        echo -e "\nUsername cannot be empty"
        echo -e "Please enter a valid username.\n"
    # elif grep -q ",$USERNAME," "$DB_PATH_PLYR"; then
    #     echo -e "\nUsername \"$USERNAME\" already exists."
    #     echo -e "Please choose a different username.\n"
    else
        break
    fi
done

# register email
while true; do
    echo -n "Email: "
    read EMAIL
    if [ -z "$EMAIL" ]; then
        echo -e "\nEmail cannot be empty"
        echo -e "Please enter a valid email.\n"
    elif ! [[ "$EMAIL" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
        echo -e "\nEmail \"$EMAIL\" is not valid."
        echo -e "Email must contain \'@\' and \'.<domain>\'\n"
        echo -e "Please enter a valid email.\n"
    elif grep -q "$EMAIL" "$DB_PATH_PLYR"; then
        echo -e "\nEmail \"$EMAIL\" already exists."
        echo -e "Please choose a different email.\n"
    else
        break
    fi
done

# register password
while true; do
    echo -n "Password: "
    read -s PASSWORD
    if [ -z "$PASSWORD" ]; then
        echo -e "\nPassword cannot be empty"
        echo -e "Please enter a valid password.\n"
    elif [ ${#PASSWORD} -lt 8 ] || ! [[ "$PASSWORD" =~ [A-Z]+ ]] || ! [[ "$PASSWORD" =~ [a-z]+ ]] || ! [[ "$PASSWORD" =~ [0-9]+ ]]; then
            echo -e "\nPassword must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, and one number."
            echo -e "Please enter a valid password.\n"
    else 
        break
    fi
done

# append to database
echo -e "\nRegistering new player..."
echo "$EMAIL,$USERNAME,$PASSWORD" >> $DB_PATH_PLYR
if [ $? -ne 0 ]; then
    echo "Failed to register new player. Exiting..."
    exit 1
else
    echo "Player registered successfully."
fi
