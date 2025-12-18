#!/bin/bash
set -e

PROFILE=${1:-local}
PLATFORM=${2:-linux/amd64}
BUILD_CONTAINER="kamailio-build"

echo "=========================================="
echo "Building Kamailio Docker Image"
echo "Platform: ${PLATFORM}"
echo "Profile: ${PROFILE}"
echo "=========================================="

# Clean up any existing build container
docker rm -f ${BUILD_CONTAINER} 2>/dev/null || true

# Build image with Kamailio compilation inside
docker build --platform ${PLATFORM} -t kamailio-builder:${PROFILE} .

# Extract compiled binaries
echo ""
echo "Extracting compiled binaries..."

# Create container from build image
docker create --platform ${PLATFORM} --name ${BUILD_CONTAINER} kamailio-builder:${PROFILE}

# Extract the compiled binaries
mkdir -p ./compiled
docker cp ${BUILD_CONTAINER}:/kamailio ./compiled-temp

# Move contents up one level
mv ./compiled-temp/kamailio/* ./compiled/ 2>/dev/null || mv ./compiled-temp/* ./compiled/
rm -rf ./compiled-temp

# Clean up
docker rm ${BUILD_CONTAINER}

echo ""
echo "=========================================="
echo "Build completed!"
echo "Binaries: ./compiled/"
echo "=========================================="
