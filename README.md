The RIT Fedora Remix
====================


## Instructions
### Setup 
* Install lorax
```
  sudo dnf install lorax
```
* Clone this repo
```  
  git clone https://github.com/RITlug/TigerOS.git
```
### Build the ISO
From the directory where you cloned this repo run the command below. You may need to preface it with `sudo` if you do not have root privileges.
```
livemedia-creator --ks tigeros.ks --no-virt --resultdir /var/lmc --project TigerOS-Live --make-iso --volid TigerOS --iso-only --iso-name TigerOS.iso --releasever 25 --title TigerOS-live --macboot
```
The resulting iso will be in /var/lmc/

## Authors

* Aidan Kahrs <axk4545@rit.edu>
* Josh Bicking (Tutorials) <jhb2345@rit.edu>


## Tasks


## Resources

* [RITlug website](http://ritlug.com)
* [RITlug @ GitHub](https://github.com/RITlug)
* [About Fedora Remixes](https://fedoraproject.org/wiki/Remix)
* [Building ISOs With Livemedia Creator](https://fedoraproject.org/wiki/Livemedia-creator-_How_to_create_and_use_a_Live_CD)
* [2017-02-24 Etherpad notes](https://etherpad.gnome.org/p/rit-remix-discussion)
