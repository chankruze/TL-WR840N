## Installing Dependencies
- We need following utilities to be installed in order to compile firmware
```
sudo apt install subversion g++ zlib1g-dev build-essential git python time
sudo apt install libncurses5-dev gawk gettext unzip file libssl-dev wget
```
## Checking out Source
- Clone latest source repository by `git clone https://www.github.com/openwrt/openwrt -b branch_name`
- Now change directory to openwrt by `cd openwrt`.This is our `<buildroot dir>` for this guide.
## Updating Feeds
- Update feeds: `./scripts/feeds update -a`
- Make downloaded package(s) available in make menuconfig:
    - single package : `./scripts/feeds install <PACKAGENAME>`
    - all packages : `./scripts/feeds install -a`

## Image Configuration

### Make menuconfig
- run `make menuconfig` and set "Target System", "Subtarget", "Target Profile" and modify set of package(s).
-  You have three options: y, m, n which are represented as follows:
    - pressing y sets the <*> built-in label
    - This package will be compiled and included in the firmware image file.
    - pressing m sets the <M> package label
    - This package will be compiled, but not included in the firmware image file. (E.g. to be installed with opkg after flashing the firmware image file to the device.)
    - pressing n sets the < > excluded label
    - The source code will not be processed.
- When you save your configuration, the file `<buildroot dir>/.config` will be created according to your configuration. 

### Creating diff file (optional)
- It also optional for you but i feel like it is a good practice to build diff file.
- This file includes only the changes compared to the default configuration. A benefit is that this file can be version controlled with your OpenWRT based project. It's also less affected by OpenWRT updates, because it only contains the changes. 
- `./scripts/diffconfig.sh > diffconfig # write the changes to diffconfig`

### Patches (optional)
- As we are building Vanilla , i didn't use any patches.

### Defconfig
- will produce a general purpose configuration of the build system including a check of dependencies and prerequisites for the build environment etc
- will check for dependencies. Install missing and run again.
- `make defconfig`

## Building Images
- `make` or `make world`
- This simple command will trigger a cascade of activity. As already stated, it will
    - compile the toolchain
    - then crosscompile the sources with this toolchain
    - create opkg-packages
    - generate a firmware image file ready to be flashed.
#### Locating Images
- After a successful build, the freshly built image(s) can be found in the newly created `<buildroot_dir>/bin` directory. The compiled files are additionally classified by the target platform, so e.g. a firmware built for an ar71xx device will be located in `<buildroot_dir>/bin/ar71xx` directory.

## Cleaning Up
You might need to clean your build environment every now and then. The following make-targets are useful for that job:

**CAUTION:** In addition to all else, this will erase your build configuration (<buildroot_dir>/.config), your toolchain and all other sources. Use with care! 

- **Clean**
    - `make clean`
    - deletes contents of the directories /bin and /build_dir. make clean does not remove the toolchain, it also avoids cleaning architectures/targets other than the one you have selected in your .config
- **Dirclean**
    - `make dirclean`
    - deletes contents of the directories /bin and /build_dir and additionally /staging_dir and /toolchain (=the cross-compile tools) and /logs. 'Dirclean' is your basic "Full clean" operation.
- **Distclean**
    - `make distclean`
    - nukes everything you have compiled or configured and also deletes all downloaded feeds contents and package sources.
- **Clean small part**
    - Clean linux objects : `make target/linux/clean`
    - Clean package base-files objects : `make package/base-files/clean`
    - Clean luci : `make package/luci/clean`

## In a Nutshell:
   - `git clone https://www.github.com/openwrt/openwrt -b branch_name`(master | openwrt-17.01 | openwrt-18.06) 
   - `cd openwrt`
   - `./scripts/feeds update -a`
   - `./scripts/feeds install -a`
   - `make menuconfig` and set "Target System", "Subtarget", "Target Profile" and modify set of package(s).
   - `make defconfig`
   - `scripts/diffconfig.sh >mydiffconfig` (save your changes in the text file mydiffconfig)
   - `make download` (download all dependency source files before final make, enables multi-core compilation)
   - `make` / `make world` or (make -jx)
   - **if build failed ...**
        - run `make -j1 V=s` (build OpenWRT with console logging,one job ata a time & can see where build failed.)
## Totally Automate
   - Skip all manual work by executing `Build-Vanilla.sh`
	- It will clone source,update&install feed,manu config and defconfig,download packages as well as start the build process.

## Troubleshooting
- ### *-factory.bin and *-sysupgrade.bin images for my device do not get generated
  When you execute make to build an OpenWRT image for your device, both a sysupgrade and a factory image should be generated for every board that is linked to the device profile that you have selected via make config or make menuconfig.
  For example, when you select the TP-Link WR710N profile, the should be a seperate sysupgrade and a factory image generated for both the WR710N-v1 and the WR710N-v2 (the main difference between the two devices is the size of the flash chip: the v1 comes with 8MiB of flash while the v2 only has 4MiB).
  
  If running make does not yield images for one (or even all) of the boards linked to the device profile that you have selected, than you probably have selected/enabled too much stuff, resulting in an image that would be too big to be flashed onto your device.
  Please note that the OpenWRT buildroot will currently (October 2018) not display any warning or error message if an image cannot be created because it would be too big for its designated target board.
  Please keep in mind that in most cases, you will not be able to use all the flash memory in your device exclusively for your OpenWRT image, because there might be several separate flash partitions dedicated to things like the boot loader, the calibration data of the devices wifi card or the partition where your configuration data is stored.



