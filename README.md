# Minecraft #
1. Download latest spigot.jar
2. Rename to spigot.jar
3. Add to the folder "data"


**Run docker**
docker run -d -v ./server-volume:/server -p 25565:25565 --name="vonken-minecraft-spigot-prod" vonken-minecraft-spigot

**Build**
docker build -t vonken-minecraft-spigot .


´docker build -t vonken-minecraft-spigot .´


https://github.com/Tiiffi/mcrcon/releases/latest
