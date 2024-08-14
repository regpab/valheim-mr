#!/bin/bash

path=~/Library/Application\ Support/Steam/steamapps/common/Valheim

if [ "$1" == "install" ]; then
    if [ "$EUID" -ne 0 ]
      then echo "Please run as root"
      exit
    fi
    
    wget -P "$path" "https://github.com/BepInEx/BepInEx/releases/download/v5.4.23.2/BepInEx_macos_x64_5.4.23.2.zip"
    wait $!

    cd "$path"


    unzip BepInEx_macos_x64_5.4.23.2.zip
    rm BepInEx_macos_x64_5.4.23.2.zip

    sed -i '' 's/executable_name=""/executable_name="valheim.app"/' run_bepinex.sh
    chmod 775 run_bepinex.sh
    arch -x86_64 /bin/bash ./run_bepinex.sh -console
fi

if [ "$1" == "setup" ]; then
    if [ "$EUID" -ne 0 ]
      then echo "Please run as root"
      exit
    fi

    sed -i '' 's/Type = Application/Type = GameObject/' "$path/BepInEx/config/BepInEx.cfg"
    echo "Setup complete"
fi

if [ "$1" == "run" ]; then
    cd "$path"
    arch -x86_64 /bin/bash ./run_bepinex.sh -console 
fi

if [ $1 == "add" ]; then
    if [ "$EUID" -ne 0 ]
      then echo "Please run as root"
      exit
    fi

    filename=$(basename -- "$2")
    if [ "${filename##*.}" != zip ]; then
        echo "Not a zip file"
        exit 0
    fi
    cp $2 "$path/BepInEx/plugins/"
    cd "$path/BepInEx/plugins/"
    unzip $filename
    rm $filename
    echo "Mod "${filename%.*}" added"
fi
