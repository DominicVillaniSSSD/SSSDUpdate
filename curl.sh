#!/bin/bash

#Latest Release
google_chrome_url="https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"
google_drive_url="https://dl.google.com/drive-file-stream/GoogleDrive.dmg"
crisis_go="https://crisisgoapp.s3.amazonaws.com/Mac/CrisisGo_latest.pkg"
zoom_url="https://zoom.us/client/latest/Zoom.pkg"
# arm zoom link
zoom_arm64_url="https://zoom.us/client/latest/Zoom.pkg?archType=arm64" 

#Version specific 
smart_notebook_url="https://downloads.smarttech.com/software/education/24.1/mac/24.1.228.0/smart24-1-web.dmg"
smart_notebook22_1_url="https://downloads.smarttech.com/software/education/22.1/mac/22.1.496.0/smart22-1-web.dmg"
air_server_url="https://dl.airserver.com/mac/AirServer-7.2.7.dmg"
app_cleaner_url="https://freemacsoft.net/downloads/AppCleaner_3.6.8.zip"
cannon_driver="https://downloads.canon.com/bicg2024/drivers/PS-v4.17.17-Mac.zip"
#chrome versions
google_chrome_url_128="https://dl.google.com/dl/chrome/mac/legacy10_15/GGRO/googlechrome.dmg" #for MacOS10.15
google_chrome_url_88="https://dl.google.com/dl/chrome/mac/legacy10_13/GGRO/googlechrome.dmg" #for MacOS10.13 and MacOS10.14
google_chrome_url_73="https://dl.google.com/dl/chrome/mac/legacy10_11/GGRO/googlechrome.dmg" #for MacOS 10.11 and MacOS10.12
google_chrome_url_67="https://dl.google.com/dl/chrome/mac/64bit/stable/GGRO/googlechrome.dmg" #for MacOS10.10
google_chrome_url_49="https://dl.google.com/dl/chrome/mac/legacy10_9/GGRO/googlechrome.dmg" #for MacOS10.9
google_chrome_url_48="https://dl.google.com/dl/chrome/mac/legacy/GGRO/googlechrome.dmg" #for MacOS10.8 - MacOS10.6

#onyX
onyx_url="skip"
onyx_el_capitan_url="https://www.titanium-software.fr/download/1011/OnyX.dmg"
onyx_sierra_url="https://www.titanium-software.fr/download/1012/OnyX.dmg"
onyx_high_sierra_url="https://www.titanium-software.fr/download/1013/OnyX.dmg"
onyx_mojave_url="https://www.titanium-software.fr/download/1014/OnyX.dmg"
onyx_catalina_url="https://www.titanium-software.fr/download/1015/OnyX.dmg"
onyx_big_sur_url="https://www.titanium-software.fr/download/11/OnyX.dmg"
onyx_monterey_url="https://www.titanium-software.fr/download/12/OnyX.dmg"
onyx_ventura_url="https://www.titanium-software.fr/download/13/OnyX.dmg"
onyx_sonoma_url="https://www.titanium-software.fr/download/14/OnyX.dmg"
onyx_sequoia_url="https://www.titanium-software.fr/download/15/OnyX.dmg"


#Hosted on the SSSD server
visualizer_url="skip"
#MS Office
#MS Word URLs for different macOS versions
word_url="skip"
word_el_capitan_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.16.20101200_Installer.pkg"
word_sierra_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.30.19101301_Installer.pkg"
word_high_sierra_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.43.20110804_Installer.pkg"
word_mojave_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.54.21101001_Installer.pkg"
word_catalina_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.66.22101101_Installer.pkg"
word_big_sur_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.77.23091703_Installer.pkg"
word_monterey_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.89.24091630_Installer.pkg"
word_ventura_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Word_16.92.24120731_Installer.pkg"

#MS Excel URLs for different macOS versions
excel_url="skip"
excel_el_capitan_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Excel_16.16.20101200_Installer.pkg"
excel_sierra_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Excel_16.30.19101301_Installer.pkg"
excel_high_sierra_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Excel_16.43.20110804_Installer.pkg"
excel_mojave_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Excel_16.54.21101001_Installer.pkg"
excel_catalina_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Excel_16.66.22101101_Installer.pkg"
excel_big_sur_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Excel_16.77.23091703_Installer.pkg"
excel_monterey_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Excel_16.89.24091630_Installer.pkg"
excel_ventura_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Excel_16.92.24120731_Installer.pkg"

#MS PowerPoint URLs for different macOS versions
powerpoint_url="skip"
powerpoint_el_capitan_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_PowerPoint_16.16.20101200_Installer.pkg"
powerpoint_sierra_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_PowerPoint_16.30.19101301_Installer.pkg"
powerpoint_high_sierra_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_PowerPoint_16.43.20110804_Installer.pkg"
powerpoint_mojave_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_PowerPoint_16.54.21101001_Installer.pkg"
powerpoint_catalina_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_PowerPoint_16.66.22101101_Installer.pkg"
powerpoint_big_sur_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_PowerPoint_16.77.23091703_Installer.pkg"
powerpoint_monterey_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_PowerPoint_16.89.24091630_Installer.pkg"
powerpoint_ventura_url="https://officecdnmac.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_PowerPoint_16.92.24120731_Installer.pkg"
