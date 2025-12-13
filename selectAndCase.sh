#!/bin/bash

select os in linux windows mac; do

    case "$os" in
        linux)
            echo "You selected Linux"
            echo "Thanks"
            break
            ;;
        windows)
            echo "You selected Windows"
            echo "Thanks"
            break
            ;;
        mac)
            echo "You selected Mac"
            echo "Thanks"
            break
            ;;
        *)
            echo "Invalid selection, try again"
            ;;
    esac
done
