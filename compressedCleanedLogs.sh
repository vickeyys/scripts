#!/bin/bash
THRESHOLD=80
USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
  find /var/log/myapp/ -type f -mtime +3 -exec gzip {} \;
  find /var/log/myapp/ -type f -name "*.gz" -mtime +7 -delete
  echo "$(date): Disk usage $USAGE% - logs compressed & cleaned" >> /var/log/disk-autoheal.log
fi



