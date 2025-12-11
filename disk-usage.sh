#!/bin/bash

THRESHOLD=70
EMAIL="vishal.bhargave1990@gmail.com"

USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Disk usage is at ${USAGE}% on $(hostname)" | mail -s "Disk Alert: $(hostname)" "$EMAIL"
fi


## now you can run this script with bwlow ansible playbook


---
- name: Deploy disk alert script
  hosts: all
  become: yes

  tasks:

    - name: Copy disk check script
      copy:
        src: disk_check.sh
        dest: /usr/local/bin/disk_check.sh
        mode: '0755'

    - name: Create cron job
      cron:
        name: "Disk Usage Alert"
        job: "/usr/local/bin/disk_check.sh"
        minute: "*/5"
