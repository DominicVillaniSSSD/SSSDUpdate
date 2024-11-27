#!/bin/bash

ask_cleanup() {
    read -p "Would you like to clean up script files? (yes/no): " response
    case "$response" in
        [Yy][Ee][Ss]|[Yy])
            echo "Cleaning up script files..."
            # Add the cleanup commands here
            ;;
        [Nn][Oo]|[Nn])
            echo "Skipping cleanup."
            ;;
        *)
            echo "Invalid response. Please answer yes or no."
            ask_cleanup
            ;;
    esac
}

# Call the function
#ask_cleanup

cleanup() {
    temp_dir=$1
    starting_dir=$2
    # Clean up the temp directory
    cd ..
    rm -rf $temp_dir
    echo -e "${GREEN}Cleaned up the temp directory${NC}"

    # Clean up the update.sh file
    cd $starting_dir
    rm update.sh
    echo -e "${GREEN}Cleaned up the update.sh file${NC}"
}

fullcleanupSmartSoftware() {
    echo "Cleaning up SMART Technologies software..."

    # Remove main application and library support files
    sudo rm -rf "/Applications/SMART Technologies"
    sudo rm -rf "/Library/Application Support/SMART Technologies"
    sudo rm -rf "/Library/Application Support/SMART Technologies Inc"
    sudo rm -rf "/Library/Shared/SMART Technologies"
    
    # Remove LaunchDaemons and LaunchAgents
    sudo rm -f /Library/LaunchDaemons/com.smarttech.*
    sudo rm -f /Library/LaunchAgents/com.smarttech.*

    # Remove receipts
    sudo rm -f /var/db/receipts/com.smarttech.*

    # Remove caches and preferences
    sudo rm -rf /Library/Caches/com.smarttech.*
    for user_dir in /Users/*; do
        sudo rm -rf "$user_dir/Library/Application Support/SMART Technologies"
        sudo rm -rf "$user_dir/Library/Application Support/SMART Technologies Inc"
        sudo rm -rf "$user_dir/Library/Caches/com.smarttech.*"
        sudo rm -f "$user_dir/Library/Preferences/com.smarttech.SMARTInk.plist"
        sudo rm -f "$user_dir/Library/Preferences/com.smarttech.SMARTSystemMenu.plist"
        sudo rm -f "$user_dir/Library/LaunchAgents/com.smarttech.*"
        sudo rm -rf "$user_dir/.smarttech"  # Hidden files
    done

    # Remove command-line binaries if any
    sudo rm -f /usr/local/bin/smart*
    sudo rm -f /usr/bin/smart*

    echo "SMART Technologies software full cleanup completed."
}

fullcleanupSmartSoftware

#cleanup
rm cleanup.sh
rm setup.sh


