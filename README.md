![Guacamayita boni](http://www.hbw.com/sites/default/files/styles/large_a/public/figures/hbw04/jpg/04_45_190_ara_glaucogularis.jpg)

# Ara Glaucogularis

A Make script to deploy Ghost on CentOS.

## Usage
```unix
wget https://raw.githubusercontent.com/ZuraGuerra/ara-glaucogularis/master/Makefile
make
```

## Notes
It currently installs **the latest version** of Ghost and Node/NPM.

## Targets

* `make packages`:
Installs common needed packages.

* `make node`:
Installs *the latest version* of Node.js/NPM available for CentOS.

* `make ghost`:
Installs *the latest version* of Ghost.

* `make run`:
Runs a Ghost daemon in production mode.

* `make`:
Does all of the above in that order.

---
![Mazing Studio](https://avatars1.githubusercontent.com/u/19610766?v=3&s=200)

Made with 💙 for [Mazing Studio](https://mazing.studio).
