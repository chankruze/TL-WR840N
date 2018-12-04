
# Flashing Firmware In TL-TW840N-v2
The following method is also applicable for debricking if your router is bricked.It is safe and easy.

## TFTP recovery via bootloader

As most other current TP-Link routers this device can be flashed and debricked without serial access. Basically, the procedure is as follows:

   0. Connect Cat 5 cable to router's WAN port and PC's ethernet port.
   1. Set your PC to use the static IP address 192.168.0.66 and close all other LAN/WIFI.(the router will have 192.168.0.86)
   2. Put an OpenWrt factory image or tp-link image in the root directory of an TFTP server and start it.Just the filename has to be named as a `wr840nv2_en_tp_recovery.bin`
   3. Power on the router while pressing the reset button until the lock LED is lighting up
   4. Wait for the router to reboot
   5. Now your router has tplink firmware but now the only problem is our router's LAN ports are behaving like WAN port.To fix this connect to router via wifi and flash the original tplink firmware via web interface choosing system upgrade option.Now Enjoy ! 
   
   ![New Life](https://image.ibb.co/dx4Gko/IMG_20180520_232938.jpg)

**:!:WARNING! For hardware version 13, it is very likely that u-boot will be erased while using this method, as most mediatek SOC models tend to! Therefore, do NOT flash sysupgrade image using TFTP! Instead, follow the instructions described here: tftp_recovery_de-bricking for the factory image, for OpenWrt image, you must append the bootloader using dd. If the bootloader gets overwritten, the only way out is to use a SPI flash programmer to reflash it.**

TFTP server log may contain info about firmware image name that router requested. Something like: `Read request for file <wr841nv8_tp_recovery.bin> . Mode octet [21/11 09:45:27.574] `

For example log in my case:
```
Connection received from 192.168.0.86 on port 3496 [20/05 10:54:23.452]
Read request for file <wr840nv2_en_tp_recovery.bin>. Mode octet [20/05 10:54:23.454]
File <wr840nv2_en_tp_recovery.bin> : error 2 in system call CreateFile The system cannot find the file specified. [20/05 10:54:23.455]
Connection received from 192.168.0.86 on port 3496 [20/05 10:54:26.651]
Read request for file <wr840nv2_en_tp_recovery.bin>. Mode octet [20/05 10:54:26.652]
File <wr840nv2_en_tp_recovery.bin> : error 2 in system call CreateFile The system cannot find the file specified. [20/05 10:54:26.652]
Connection received from 192.168.0.86 on port 3496 [20/05 10:54:29.851]
Read request for file <wr840nv2_en_tp_recovery.bin>. Mode octet [20/05 10:54:29.851]
File <wr840nv2_en_tp_recovery.bin> : error 2 in system call CreateFile The system cannot find the file specified. [20/05 10:54:29.851]
Connection received from 192.168.0.86 on port 3496 [20/05 10:54:33.051]
Read request for file <wr840nv2_en_tp_recovery.bin>. Mode octet [20/05 10:54:33.051]
File <wr840nv2_en_tp_recovery.bin> : error 2 in system call CreateFile The system cannot find the file specified. [20/05 10:54:33.051]
```
## Downloads
- [tftpd64](https://bitbucket.org/phjounin/tftpd64/wiki/Download%20Tftpd64)
- [Stock Firmware](https://www.tp-link.com/in/download/TL-WR840N_V2.html) (carefully choose region)



