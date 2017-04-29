TigerOS
====================

## Instructions
### Setup 
* Clone this repo
```  
  git clone https://github.com/RITlug/TigerOS.git
```
Install lorax-lmc-novirt

### Build the ISO
Requires current version of Fedora.x86\_64 to build.
From the directory where you cloned this repo run the commands below. You may need to preface it with `sudo` if you do not have root privileges.
```
chmod +x make-iso.sh
bash make-iso.sh
```
With a 3.40GHz dual core i3 CPU with hyperthreading enabled and 16GB of RAM, the build process after the initial build should take approximately 40 minutes to complete. The initial build time will vary based on specs. 

## Authors

* Aidan Kahrs (Lead) <axk4545@rit.edu>
* Josh Bicking (Tutorials) <jhb2345@rit.edu>
* Regina Locicero (Designer) <rtl3971@rit.edu>
* Tim Zabel (Scripts) <tjz8659@rit.edu>


## Tasks

## Contributing
Please see [CONTRIBUTING.md](CONTRIBUTING.md)
## Resources

* [RITlug website](http://ritlug.com)
* [RITlug @ GitHub](https://github.com/RITlug)
* [About Fedora Remixes](https://fedoraproject.org/wiki/Remix)
* [Building ISOs With Livemedia Creator](https://fedoraproject.org/wiki/Livemedia-creator-_How_to_create_and_use_a_Live_CD)
* [2017-02-24 Etherpad notes](https://etherpad.gnome.org/p/rit-remix-discussion)
