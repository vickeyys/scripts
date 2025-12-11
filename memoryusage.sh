#!/bin/bash

THRESHOLD=70
EMAIL="your-email@example.com"

# Get memory usage percentage
USAGE=$(free | grep Mem | awk '{print ($3/$2)*100}' | cut -d'.' -f1)

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Memory usage is at ${USAGE}% on $(hostname)" \
    | mail -s "Memory Alert on $(hostname)" "$EMAIL"
fi
