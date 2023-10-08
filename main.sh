#!/bin/sh

echo "Enter the command ([Enter] to get the command description)："
# 输入命令([Enter]去获得命令说明)
read input

if [ "$input" = "k1" ]; then
    echo "---TestBuildOneLife---"
    cd ..
    mkdir OneLifeLinux
    cd OneLife/scripts/
    chmod +x TestBuildOneLife.sh
    ./TestBuildOneLife.sh
    # ---TestBuildOneLife---

elif [ "$input" = "k2" ]; then
    echo "---TestBuildOneEditor---"
    cd ..
    mkdir OneEditorLinux
    cd OneLife/scripts/
    chmod +x testBuildEditor.sh
    ./testBuildOneEditor.sh
    # ---TestBuildOneEditor---

elif [ "$input" = "k3" ]; then
    echo "---TestBuildOneServer---"
    cd ..
    mkdir OneSeverLinux
    cd OneLife/scripts/
    chmod +x testBuildServer.sh
    ./testBuildOneServer.sh
    # ---TestBuildOneServer---

elif [ "$input" = "k4" ]; then
    echo "---CleanOldBuilds---"
    cd scripts
    chmod +x CleanOldBuilds.sh
    ./CleanOldBuilds.sh
    # ---CleanOldBuilds---

elif [ "$input" = "p1" ]; then
    echo "---BuildOneLife---"
    # ---BuildOneLife---

elif [ "$input" = "p2" ]; then
    echo " "
    # --- ---

elif [ "$input" = "p3" ]; then
    echo " "
    # --- ---

elif [ "$input" = "p4" ]; then
    echo " "
    # --- ---

elif [ "$input" = "u1" ]; then
    echo " "
    # --- ---

elif [ "$input" = "u2" ]; then
    echo " "
    # --- ---

elif [ "$input" = "u3" ]; then
    echo " "
    # --- ---

elif [ "$input" = "u4" ]; then
    echo " "
    # --- ---
else
    echo "Command Description:"
    # 命令说明
    echo "exploit - K"
    echo "k1 to start TestBuildOneLife"
    echo "k2 to start TestBuildOneEditor"
    echo "k3 to start TestBuildOneServer"
    echo "k4 to start CleanOldBuilds"
    exit 0
fi
