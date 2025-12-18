#!/bin/bash
set -e

echo "Stopping Kamailio..."
docker-compose down
echo "Stopped."
