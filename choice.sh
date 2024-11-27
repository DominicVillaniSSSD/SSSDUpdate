#!/bin/bash

cleanupSmartSoftware() {
    echo "Cleaning up SMART Technologies software..."

    # Remove main application and library support files
    sudo rm -rf "/Applications/SMART Technologies"
    sudo rm -rf "/Library/Application Support/SMART Technologies"
    sudo rm -rf "/Library/Application Support/SMART Technologies Inc"
    sudo rm -rf "/Library/Shared/SMART Technologies"
    
    # Remove LaunchDaemons and LaunchAgents
    #sudo rm -f /Library/LaunchDaemons/com.smarttech.* #not sure if this is needed
    #sudo rm -f /Library/LaunchAgents/com.smarttech.*

    # Remove receipts
    sudo rm -f /var/db/receipts/com.smarttech.*

    # Remove caches and preferences
    sudo rm -rf /Library/Caches/com.smarttech.*
    for user_dir in /Users/*; do
        sudo rm -rf "$user_dir/Library/Application Support/SMART Technologies"
        sudo rm -rf "$user_dir/Library/Application Support/SMART Technologies Inc"
        sudo rm -rf "$user_dir/Library/Caches/com.smarttech.*"
        #sudo rm -f "$user_dir/Library/Preferences/com.smarttech.SMARTInk.plist"
        #sudo rm -f "$user_dir/Library/Preferences/com.smarttech.SMARTSystemMenu.plist"
        #sudo rm -f "$user_dir/Library/LaunchAgents/com.smarttech.*"
        sudo rm -rf "$user_dir/.smarttech"  # Hidden files
    done

    # Remove command-line binaries if any
    sudo rm -f /usr/local/bin/smart*
    sudo rm -f /usr/bin/smart*

    echo "SMART Technologies software cleanup completed."
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

install_applications_teacher(){
    install_application_from_url "$app_cleaner_url"
    install_application_from_url "$zoom_url"
    install_application_from_url "$smart_notebook_url"
    install_application_from_url "$google_chrome_url"
    install_application_from_url "$air_server_url"
    install_application_from_url "$crisis_go"
    install_application_from_url "$cannon_driver"
    install_application_from_url "$onyx_url"
}

install_applications_office(){
    install_application_from_url "$app_cleaner_url"
    install_application_from_url "$zoom_url"
    install_application_from_url "$google_chrome_url"
    install_application_from_url "$crisis_go"
    install_application_from_url "$cannon_driver"
}

list_and_install_applications() {
    echo "Please select the applications you would like to install by entering the corresponding numbers separated by spaces:"
    options=(
        "App Cleaner"
        "Zoom"
        "Smart Notebook"
        "Google Chrome"
        "Air Server"
        "Crisis Go"
        "Canon Driver"
        "OnyX"
    )

    for i in "${!options[@]}"; do
        echo "$((i+1)). ${options[i]}"
    done

    read -p "Enter your choices: " -a choices

    for choice in "${choices[@]}"; do
        case $choice in
            1) install_application_from_url "$app_cleaner_url" ;;
            2) install_application_from_url "$zoom_url" ;;
            3) 
                # If Smart Notebook is selected, remove the SMART Technologies folder
                cleanupSmartSoftware
                install_application_from_url "$smart_notebook_url"
                ;;
            4) install_application_from_url "$google_chrome_url" ;;
            5) install_application_from_url "$air_server_url" ;;
            6) install_application_from_url "$crisis_go" ;;
            7) install_application_from_url "$cannon_driver" ;;
            8) install_application_from_url "$onyx_url" ;;
            *) echo "Invalid choice: $choice" ;;
        esac
    done
}

first_choice(){
    read -p "Will This computer be used with a Smart Board? (y/n) or would you like to manually select applications? (m)" answer
    if [[ "$answer" == "y" ]]; then
        #remove smart technologies folder from /Applications to prevent errors
        cleanupSmartSoftware
        install_applications_teacher
    elif [[ "$answer" == "n" ]]; then
        install_applications_office
    elif [[ "$answer" == "m" ]]; then
        list_and_install_applications
    else
        echo "Invalid choice: $answer"
    fi
}