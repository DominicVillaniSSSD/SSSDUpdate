#!/bin/bash
source setup.sh
source curl.sh
install_zip(){
    local file=$1
    local unzipped_folder="/tmp/$(basename "$file" .zip)"
    echo -e "${YELLOW}Unzipping $file to $unzipped_folder...${NC}"
    unzip -qq "$file" -d "$unzipped_folder"
    for unzipped_file in "$unzipped_folder"/*; do
        process_file "$unzipped_file"
    done
}

# Function to handle installation of .pkg files
install_pkg() {
    local pkg_file=$1
    echo -e "${YELLOW}Installing $pkg_file...${NC}"
    sudo installer -pkg "$pkg_file" -target /
    echo -e "${DARK_GREEN}Installation of $pkg_file complete${NC}"
}

# Function to move .app files to the /Applications directory
move_app() {
    local app_file=$1
    local app_name=$(basename "$app_file" .app)
    
    echo -e "${YELLOW}Checking if $app_name is running...${NC}"
    if pgrep -x "$app_name" > /dev/null; then
        echo -e "${ORANGE}$app_name is currently running. Closing it...${NC}"
        pkill -x "$app_name"
        echo -e "${GREEN}$app_name closed.${NC}"
    fi

    echo -e "${YELLOW}Moving $app_file to /Applications...${NC}"
    if [ -d "/Applications/$app_name.app" ]; then
        echo -e "${ORANGE}Removing old version of $app_name...${NC}"
        sudo rm -rf "/Applications/$app_name.app"
    fi
    sudo cp -R "$app_file" /Applications/
    echo -e "${DARK_GREEN}$app_file moved to /Applications${NC}"
}

# Function to handle installation of .dmg files
install_dmg() {
    local dmg_file="$1"
    echo -e "${YELLOW}$dmg_file is a .dmg file.${NC}"

    # Mount the installer disk image and capture the mount point
    MOUNT_POINT=$(hdiutil attach "$dmg_file" | grep -o '/Volumes/.*' | head -n 1)
    echo -e "${GREEN}Mounted at: $MOUNT_POINT${NC}"  # Debug statement
    
    if [[ -z "$MOUNT_POINT" ]]; then
        echo -e "${RED}Failed to mount $dmg_file${NC}"
        return
    fi

    # Check for .app files within the mount point (only at the top level)
    APP_FILE=$(find "$MOUNT_POINT" -maxdepth 1 ! -name ".*" -name "*.app" -type d)
    echo -e "${MAGENTA}Found .app: $APP_FILE${NC}"  # Debug statement

    if [[ -n "$APP_FILE" ]]; then
        move_app "$APP_FILE"
        echo -e "${DARK_GREEN}Installation of $dmg_file complete${NC}"
    else
        # If no .app file is found, check for .pkg files (only at the top level)
        PKG_FILE=$(find "$MOUNT_POINT" -maxdepth 1 -name "*.pkg" -type f)
        echo -e "${MAGENTA}Found .pkg: $PKG_FILE${NC}"  # Debug statement
        if [[ -n "$PKG_FILE" ]]; then
            echo -e "${YELLOW}Installing from $PKG_FILE...${NC}"
            # Install the package
            sudo installer -pkg "$PKG_FILE" -target /
            echo -e "${DARK_GREEN}Installation of $dmg_file complete${NC}"
        else
            echo -e "${RED}No .app or .pkg file found in $MOUNT_POINT.${NC}"
        fi
    fi
    # Eject the disk image after installation
    echo "Ejecting installer..."
    hdiutil detach "$MOUNT_POINT"
}


#Process file 
process_file() {
    local file=$1
    echo -e "${YELLOW}Processing file: $file${NC}"  # Debug statement
    if  [[ "$file" == *.zip ]]; then
        install_zip "$file"
    elif [[ "$file" == *.dmg ]]; then
        install_dmg "$file"
    elif [[ "$file" == *.pkg ]]; then
        install_pkg "$file"
    elif [[ "$file" == *.app ]]; then
        move_app "$file"
    else
        echo -e "${RED}File $file is neither a .dmg, .pkg, .app, nor a .zip file.${NC}"
    fi
}

install_application_from_url() {
    local app_url=$1

    if [[ "$app_url" == "skip" ]]; then
        echo -e "${YELLOW}Skipping application installation...${NC}"
        return
    fi
    
    local file_name=$(basename "${app_url%%\?*}")  # Strip query parameters from the URL
    local temp_file="/tmp/$file_name"

    echo -e "${YELLOW}Downloading application from URL: $app_url...${NC}"
    curl -L -o "$temp_file" "$app_url"

    if [[ -f "$temp_file" ]]; then
        echo -e "${GREEN}Download successful. Installing application...${NC}"
        process_file "$temp_file"
        if [[ "$temp_file" == *.zip ]]; then
            rm -r "/tmp/$(basename "$temp_file" .zip)"  # Remove unzipped directory
        fi
        rm "$temp_file"  # Remove the original downloaded file
    else
        echo -e "${RED}Failed to download the application.${NC}"
    fi
}