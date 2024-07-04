#!/bin/bash

# Clear the environment
env -i

# Function to set git configuration for work
set_work_config() {
    git config --local user.name "YOUR NAME"
    git config --local user.email "COMPANY-EMAIL"
    git config --local http.sslverify false
    echo "Local git configuration set to Work."
}

# Function to set git configuration for personal
set_personal_config() {
    git config --local user.name "GitHub DisplayName"
    git config --local user.email "PERSONAL EMAIL"
    git config --local http.sslverify false
    echo "Local git configuration set to Personal."
}

# Check the argument provided
case "$1" in
    --work|-w)
        set_work_config
        ;;
    --personal|-p)
        set_personal_config
        ;;
    *)
        echo "Usage: $0 [--work|-w|--personal|-p]"
        exit 1
        ;;
esac
