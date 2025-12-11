#!/bin/bash

THRESHOLD=70
EMAIL="your-email@example.com"

# Get CPU usage (user + system)
USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d'.' -f1)

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "CPU usage is at ${USAGE}% on $(hostname)" \
    | mail -s "CPU Alert on $(hostname)" "$EMAIL"
fi


