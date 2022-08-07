#!/bin/bash

if [ ! -f "/data/ferium-config.json" ]; then
    mv /root/.config/ferium/config.json /data/ferium-config.json
    ln -s /data/ferium-config.json /root/.config/ferium/config.json
fi
  
MODS=$(cat $MOD_CONFIG_FILE)

for MOD in $MODS
do
    $HOME/.cargo/bin/ferium add $MOD || $HOME/.cargo/bin/ferium profile create
done
$HOME/.cargo/bin/ferium upgrade

/start