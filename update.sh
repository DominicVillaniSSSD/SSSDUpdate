#!/bin/bash

Start_From_Server() {
    # Prevent the system from sleeping while the script is running
    caffeinate -i -w $$ 2>/dev/null &
    CAFFEINATE_PID=$!
    disown

    #Save the current directory
    STARTING_DIR=$(pwd)

    # Directory to store the scripts
    TEMP_DIR="/tmp/update-scripts"
    #delete the temp directory if it exists already so it will not cause errors
    rm -rf $TEMP_DIR

    # Ensure cleanup on exit
    trap 'rm -rf $TEMP_DIR' EXIT

    # Create a temporary directory
    mkdir -p $TEMP_DIR
    cd $TEMP_DIR

    # Set the branch
    branch="main"

    # Download necessary scripts
    echo -e "${YELLOW}Downloading scripts...${NC}"
    #https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/main/update.sh
    #https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/main/curl.sh
    curl -L -O https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/$branch/curl.sh #has download links for applications
    curl -L -O https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/$branch/install_handlers.sh #has instructions for how to install diffrent types of installers
    curl -L -O https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/$branch/logo.sh #has logos for SSSD and Finished and fentions to call them 
    curl -L -O https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/$branch/setup.sh #has the colors and functions to check the architecture and os versions
    curl -L -O https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/$branch/choice.sh #has the functions to select applications

    source setup.sh
    source install_handlers.sh
    source curl.sh
    source logo.sh
    source choice.sh

    print_logo

    if [ "$branch" == "testing" ]; then
        echo -e "${RED}this is the $branch branch${NC}"
    elif [ "$branch" == "main" ]; then
        echo -e "${GREEN}this is the $branch branch${NC}"
    else
        echo -e "${YELLOW}this is the $branch branch${NC}"
    fi

    check_architecture
    check_macos_version

}

Start_From_Local() {
    # Prevent the system from sleeping while the script is running
    caffeinate -i -w $$ 2>/dev/null &
    CAFFEINATE_PID=$!
    disown

    source setup.sh
    source install_handlers.sh
    source curl.sh
    source logo.sh
    source choice.sh

    print_logo
    echo "this is the $branch branch"

    check_architecture
    check_macos_version

}




Start_From_Server




first_choice

#set chrome as default browser if not already
open -a "Google Chrome" --new --args --make-default-browser
open -a "CrisisGo"

#Clean up
cd ..
rm -rf $TEMP_DIR
cd $STARTING_DIR
rm update.sh


print_finished

# Allow the system to sleep again
kill $CAFFEINATE_PID 2>/dev/null

