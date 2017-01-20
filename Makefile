# Install the latest version of Ghost on CentOS

#---------------#
#  _T_A_S_K_S_  #
#               #
# · make        #
# · packages    #
# · node        #
# · install     #
# · run         #
#---------------#

all:
	##### STARTING GHOST SETUP...
	packages node install run

packages:
	##### Installing required common packages...
	sudo yum install unzip curl wget glibc-* screen @Development Tools
	sudo yum update

node:
	##### Installing Node and NPM...
	sudo curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
	sudo yum -y install nodejs

install:
	##### Installing Ghost...
	mkdir -p /var/www/ghost && cd /var/www/ghost
	sudo curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip
	sudo unzip ghost-*.zip
	sudo rm -rf ghost-*.zip
	mv config.example.js config.js
	#sed -i 's/2368/80/g' config.js && sed -i 's/127.0.0.1/0.0.0.0/g' config.js
	sudo npm install --production

run:
	##### Running Ghost in background...
	sudo screen -S Ghost -d -m npm start --production

.PHONY: packages node install all
