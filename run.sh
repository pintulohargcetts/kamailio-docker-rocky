#!/bin/bash
set -e

echo "=========================================="
echo "Starting Kamailio Server"
echo "=========================================="

# Check if compiled directory exists
if [ ! -d "./compiled" ]; then
    echo "Error: ./compiled not found!"
    echo "Run: ./prepare.sh first"
    exit 1
fi

# Create default config if not exists
if [ ! -f "./config/kamailio.cfg" ]; then
    mkdir -p ./config
    if [ -f "./compiled/etc/kamailio/kamailio.cfg" ]; then
        cp ./compiled/etc/kamailio/kamailio.cfg ./config/
        echo "Default config copied to ./config/"
    fi
fi

# Start
docker-compose up -d

echo ""
echo "=========================================="
echo "Kamailio Started"
echo "=========================================="
echo "Logs: docker-compose logs -f"
echo "Stop: ./stop.sh"
echo "=========================================="
