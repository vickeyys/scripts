#!/bin/bash

file="user.txt"
password="123"

while read -r user; do
    if id "$user" &>/dev/null; then
        echo "user already exists"
    else
        useradd -m -s /bin/bash "$user"
        echo "$user:$password" | chpasswd
    fi
done < "$file"
