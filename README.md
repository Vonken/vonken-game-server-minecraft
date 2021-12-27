# Minecraft Server #
1. Install Docker Desktop.
2. Enable WSL in the Docker Desktop settings.
3. Execute command `docker build -t vonken-minecraft-spigot .` from command prompt.
4. Start a new container from new image.

## Connect to server console ##
https://github.com/Tiiffi/mcrcon/releases/latest

## Copy files to docker container example ##
```
docker cp "A:\VirtualMachines\Minecraft\data\plugins\Dynmap-3.3-beta-4-spigot.jar" minecraft:"/home/minecraft/plugins"
```


## Notes ##
rm -r data\plugins\dynmap\web\tiles/*

## Disabled plugins ##
ProtocolLib
WorldGuard
Movecraft 
HelthBar
Citizens
OnlinePlayersSQL
uCars
uPlanes
Craftbook
Airplanes
Quests
AntiCreeper3 
LoginSecurity
Killreward
Essentials
Marriage
Vault
