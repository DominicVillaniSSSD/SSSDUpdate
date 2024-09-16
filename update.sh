#!/bin/bash

# Prevent the system from sleeping while the script is running
caffeinate -i -w $$ 2>/dev/null &
CAFFEINATE_PID=$!
disown

# Save the current directory
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
#echo -e "${RED}This text is red${NC}"
echo -e "${YELLOW}Downloading scripts...${NC}"
curl -L -O https://raw.githubusercontent.com/DominicVillaniSSSD/update/$branch/curl.sh #has download links for applications
curl -L -O install_handlers.sh https://raw.githubusercontent.com/DominicVillaniSSSD/update/$branch/install_handlers.sh #has instructions for how to install diffrent types of installers
curl -L -O logo.sh https://raw.githubusercontent.com/DominicVillaniSSSD/update/$branch/logo.sh #has logos for SSSD and Finished and fentions to call them 
curl -L -O setup.sh https://raw.githubusercontent.com/DominicVillaniSSSD/update/$branch/setup.sh #has the colors and functions to check the architecture and os versions

source setup.sh
source install_handlers.sh
source curl.sh
source logo.sh

check_macos_version

OS_VERSION=$(sw_vers -productVersion)
if [[ "$OS_VERSION" < "10.15.0" ]]; then
    echo -e "${RED}macOS version is less than 12.0 (Catalina). Exiting script.${NC}"
    exit 1
fi

#Prints logo
print_logo
echo "this is the $branch branch"
#Checks architecture
check_architecture

#sets zoom_url to zoom_arm64_url if cpu is arm otherwise it will keep intell link
 if [[ "$ARCH" == "arm64" ]]; then
     zoom_url="$zoom_arm64_url"
 fi
 #sets smart notebook url to smart_notebook22.1_url if os version is 11-10.15
 if [[ "$OS_VERSION" == 11.* || "$OS_VERSION" == 10.15.* ]]; then
     smart_notebook_url="$smart_notebook22_1_url"
 fi

install_applications_teacher(){
install_application_from_url "$app_cleaner_url"
install_application_from_url "$zoom_url"
install_application_from_url "$smart_notebook_url"
install_application_from_url "$google_chrome_url"
install_application_from_url "$air_server_url"
install_application_from_url "$crisis_go"
install_application_from_url "$cannon_driver"
}

install_applications_office(){
install_application_from_url "$app_cleaner_url"
install_application_from_url "$zoom_url"
install_application_from_url "$google_chrome_url"
install_application_from_url "$crisis_go"
install_application_from_url "$cannon_driver"
}

read -p "Will This computer be using a Smart Board? (y/n)" update_smart_notebook
if [[ "$update_smart_notebook" == "y" ]]; then
    #remove smart technologies folder from /Applications to prevent errors
    sudo rm -rf /Applications/SMART Technologies
    install_applications_teacher
else
    install_applications_office
fi

#set chrome as default browser if not already
open -a "Google Chrome" --new --args --make-default-browser

# Clean up
cd ..
rm -rf $TEMP_DIR
cd $STARTING_DIR
rm update.sh

print_finished

# Allow the system to sleep again
kill $CAFFEINATE_PID 2>/dev/null

