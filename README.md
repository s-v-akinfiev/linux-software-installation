# Ubuntu 24 software installation scripts
### Description
This repository provides you an ability to automatically install all software
you need. It can store a list of instructions that you can reuse once you reinstall Ubuntu.

A list of available instructions you can see in `instructions` directory.

You can fork this repository and modify existed or add your own instructions. 

### Usage
1. Clone this repository
2. Open terminal in cloned repository path
3. Run `bin/install.sh`

If you need to run single instruction you can provide instruction file name without extension as an argument. 
E.g. to run `instructions/ubuntu-upgrade.sh` execute following command:  `bin/install ubuntu-upgrade`.
