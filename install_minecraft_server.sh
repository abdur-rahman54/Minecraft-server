#!/bin/bash

# Update the package list and install necessary packages
sudo apt update
sudo apt install -y openjdk-21-jre-headless screen wget

# Create a directory for the Minecraft server
mkdir -p ~/minecraft
cd ~/minecraft

# Download the Minecraft server
wget https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar -O server.jar

# Accept the EULA
echo "eula=true" > eula.txt

# Create a script to start the Minecraft server in a screen session
cat <<EOL > start_minecraft.sh
#!/bin/bash
cd ~/minecraft
screen -dmS minecraft java -Xmx1024M -Xms1024M -jar server.jar nogui
EOL

chmod +x start_minecraft.sh

# Start the Minecraft server
./start_minecraft.sh

