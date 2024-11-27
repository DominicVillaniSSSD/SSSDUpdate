# Update tool for Mac Applications at the Sulphur Springs School District 
This Tool will not update the OS version just a handfull of apps that are listed bellow 

## How to run:
To run this script paste the command below into the terminal with a user account with admin privileges  


```
curl -O https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/main/update.sh && chmod +x update.sh && sudo ./update.sh
```

### **This will update these apps:**  
Zoom (latest release)  
Chrome (latest release for your verison of MacOS) 
Google Drive (latest release)  
crisis go (latest release)  
onyx (latest release for your verison of MacOS)
###### **Version Spesific** 
Air server 7.2.7  
app_Cleaner 3.6.8  
cannon_driver PS-v4.17.17  
smart_notebook 24.0.240.1 (For newer MacOS versions) or  
smart_notebook 21.1 (For older MacOS Versions [Big Sur, Catalina])  


## *Note this script is only validated to work in MacOS Catalina and up. Some of the Software included in this script is version specific and may need to be changed to work with older version of MacOS. 

### Purge Smart Technologies:  

```
curl -O https://raw.githubusercontent.com/DominicVillaniSSSD/SSSDUpdate/refs/heads/main/cleanup.sh && chmod +x cleanup.sh && sudo ./cleanup.sh
```
