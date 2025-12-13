#!/bin/bash

set +x

read -p "select the os linux windows mac: " os

kernal="$os"

case "$kernal" in 
    linux)
        echo "you select linux"
        echo "thanks"
        ;;
    windows)
        echo "you select windows"
        echo "thanks"
        ;;
    mac)
        echo "you select mac"
        echo "thanks"
        ;;
    *)
        echo "invalid selection"
        ;;
esac
