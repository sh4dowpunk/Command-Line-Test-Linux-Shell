#!/bin/bash

user_id=""
user_name=""
password=""
attempt_time=0
question_bank="question_bank.txt"
answer_file=".TestData/answer_file.csv"
log_file="test_activity.log"
timeout_duration=10

# Function to log activities
log_activity() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

# Function to sign up
sign_up() {
    read -p "Enter user name: " user_name
    read -sp "Enter password: " password
    echo
    read -sp "Re-enter password: " reentered_password
    echo

    if [ "$password" != "$reentered_password" ]; then
        echo "Passwords do not match. Please try again."
    else
        echo "$user_name:$password" >> users.txt
        log_activity "User '$user_name' signed up."
    fi
}

# Function to sign in
sign_in() {
    read -p "Enter user name: " user_name
    read -sp "Enter password: " password
    echo

    stored_password=$(grep "^$user_name:" users.txt | cut -d ':' -f 2)
    if [ "$password" == "$stored_password" ]; then
        user_id="$user_name"
        log_activity "User '$user_id' signed in."
    else
        echo "Invalid user name or password."
    fi
}

# Function to take test
take_test() {
    if [ ! -d ".TestData" ]; then
        mkdir -p ".TestData"
    fi

    if [ ! -f "$answer_file" ]; then
        touch "$answer_file"
    fi

    log_activity "User '$user_id' started the test."

    # Process questions from the question bank
    while IFS= read -r question; do
        clear
        echo "$question"
        read -t $timeout_duration -p "Your answer: " user_answer

        if [ -z "$user_answer" ]; then
            echo "Time's up!"
            continue
        fi

        attempt_time=$(date +%s)

        echo "$user_id,$question,$user_answer,$attempt_time" >> "$answer_file"

    done < "$question_bank"

    log_activity "User '$user_id' completed the test."
    read -n 1 -s -r -p "Test completed. Press any key to return to the main menu..."
}

# Main menu
while true; do
    clear
    echo "Command Line Test - Online Testing Tool"
    echo "1. Sign Up"
    echo "2. Sign In"
    echo "3. Take Test"
    echo "4. View Test"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) sign_up ;;
        2) sign_in ;;
        3) take_test ;;
        4) echo "View Test functionality not implemented yet." ;;
        5) echo "Exiting the program. Goodbye!"; exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
