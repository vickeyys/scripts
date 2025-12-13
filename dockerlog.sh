#!/bin/bash
CONTAINER="myapp"
docker logs --since 1h $CONTAINER > logs_last_hour.txt
