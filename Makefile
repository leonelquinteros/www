# Vars
RSYNC_OPTS := --checksum --recursive --delete --human-readable --cvs-exclude --exclude=.well-known --exclude=.DS_Store --compress --verbose

# Host
HOST1 := leonelquinteros.com
WEBROOT1 := root@$(HOST1):/var/www/html/
NGINX1 := root@$(HOST1):/etc/nginx/nginx.conf

# Config
.PHONY: all build run deploy test-deploy

# Actions
all: build run

build:
	thtml -build

run:
	thtml -run

deploy: build
	rsync $(RSYNC_OPTS) ./build/ $(WEBROOT1)

test-deploy: build
	rsync --dry-run $(RSYNC_OPTS) ./build/ $(WEBROOT1)
