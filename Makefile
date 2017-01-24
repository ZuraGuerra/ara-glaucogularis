# Install the latest version of Ghost on CentOS

GHOST_PORT := $(shell echo $$GHOST_PORT)
GHOST_HOST := $(shell echo $$GHOST_HOST)

#---------------#
#  _T_A_S_K_S_  #
#               #
# · make        #
# · packages    #
# · node        #
# · install     #
# · run         #
#---------------#

all: packages node install run

packages:
	##### Installing required common packages...
	yum -y install unzip curl wget glibc-* screen @Development Tools
	yum -y update

node:
	##### Installing Node and NPM...
	curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
	yum -y install nodejs

install:
	##### Installing Ghost...
	mkdir -p /var/www/ghost
	@# See this to understand the addition of `<command> && \`:
	@# http://stackoverflow.com/a/1789616/4573662
	cd /var/www/ghost && \
	curl -L -O https://ghost.org/zip/ghost-latest.zip && \
	unzip ghost-*.zip && \
	rm -rf ghost-*.zip && \
	mv config.example.js config.js && \
	sed -i 's/2368/$(GHOST_HOST)/g' config.js && \
	sed -i 's/127.0.0.1/$(GHOST_HOST)/g' config.js && \
	npm install --production

run:
	##### Running Ghost in background...
	cd /var/www/ghost && \
	npm start --production

.PHONY: packages node install all run
