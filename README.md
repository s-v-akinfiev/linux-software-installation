# Ubuntu 24 software installation scripts
### Description
This repository provides you an ability to automatically install all software
you need. It can store a list of instructions that you can reuse once you reinstall Ubuntu.

A list of available instructions you can see in `instructions` directory.

You can fork this repository to modify existed or add your own instructions. 

### Requirements
* Git

### Usage
1. Open terminal (`CTRL+ALT+T`)
2. Clone this repository
> `git clone https://github.com/s-v-akinfiev/ubuntu-software-installation.git`
3. Open cloned directory
> `cd ubuntu-software-installation`
4. Run installation script
> `bin/install.sh`

If you need to run single instruction you can provide instruction file name without extension as an argument. 
E.g. to run `instructions/ubuntu-upgrade.sh` execute following command:  `bin/install ubuntu-upgrade`.
