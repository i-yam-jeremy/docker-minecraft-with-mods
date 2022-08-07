# docker-minecraft-with-mods
A Docker container for MineCraft servers with built-in mod configuration

# Exporting a local Ferium profile to mods.txt
Ensure you have switched to the correct ferium profile. Then run:
```ferium list | awk '{print $(NF)}' > mods.txt```
