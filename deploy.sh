#!/bin/bash


# Build static site (github.com/leonelquinteros/thtml)
echo ""
echo "Build website..."
thtml -build

echo ""
echo "Sync website..."
rsync --verbose --recursive --checksum --delete --cvs-exclude --exclude-from=deploy.exclude ./build/ root@leonelquinteros.com:/usr/local/www/leonelquinteros.com