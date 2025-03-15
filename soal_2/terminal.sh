#!/bin/bash

# pathings
SCRIPT_DIR=$(dirname "$(realpath "$0")")
LOGIN_DIR="$SCRIPT_DIR/login.sh"
REGISTER_DIR="$SCRIPT_DIR/register.sh"
DB_PATH_PLYR="$SCRIPT_DIR/data/player.csv"

# terminal interface
while true; do
    clear
    cat << EOF
========================================
     Welcome to the Game Terminal
========================================
1. Don't have an account? 
   Sign in!
2. Have an account already? 
   Log In!
3. Aww you don't wanna play? 
   Alright... bye :(
========================================
Choose an option:
EOF
    read OPTION
    case $OPTION in
        1)
            bash "$REGISTER_DIR"
            ;;
        2)
            bash "$LOGIN_DIR"
            ;;
        3)
            echo -e "\nSad to see you go :("
            exit 0
            ;;
        *)
            echo -e "\nAt least try to choose an option ^^"
            echo -e "Please choose a valid option next time ^^\n"
            ;;
    esac
    echo -e "\nPress Enter to continue..."
    read
done