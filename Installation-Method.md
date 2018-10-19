
# Flashing Firmware In TL-TW840N-v3
The following method is also applicable for debricking if your router is bricked.It is safe and easy.

## TFTP recovery via bootloader

Easiest method for v8,v9,v10,v11,v12.

As most other current TP-Link routers this device can be flashed and debricked without serial access. Basically, the procedure is as follows:

   1. Set your PC to use the static IP address 192.168.0.66 and close all other LAN/WIFI.(the router will have 192.168.0.86)
   2. Put an OpenWrt factory image or tp-link image in the root directory of an TFTP server and start it.Just the filename has to be named as a `wr840nv3_en_tp_recovery.bin`
   3. Power on the router while pressing the reset button until the lock LED is lighting up
   4. Wait for the router to reboot
   5. Now your router has tplink firmware but now the only problem is our router's LAN ports are behaving like WAN port.To fix this connect to router via wifi and flash the original tplink firmware via web interface choosing system upgrade option.Now Enjoy ! 
   
   ![New Life](https://image.ibb.co/dx4Gko/IMG_20180520_232938.jpg)

**:!:WARNING! For hardware version 13, it is very likely that u-boot will be erased while using this method, as most mediatek SOC models tend to! Therefore, do NOT flash sysupgrade image using TFTP! Instead, follow the instructions described here: tftp_recovery_de-bricking for the factory image, for OpenWrt image, you must append the bootloader using dd. If the bootloader gets overwritten, the only way out is to use a SPI flash programmer to reflash it.**

TFTP server log may contain info about firmware image name that router requested. Something like: `Read request for file <wr841nv8_tp_recovery.bin> . Mode octet [21/11 09:45:27.574] `

For example log in my case:
```
Connection received from 192.168.0.86 on port 3496 [20/05 10:54:23.452]
Read request for file <wr840nv3_en_tp_recovery.bin>. Mode octet [20/05 10:54:23.454]
File <wr840nv3_en_tp_recovery.bin> : error 2 in system call CreateFile The system cannot find the file specified. [20/05 10:54:23.455]
Connection received from 192.168.0.86 on port 3496 [20/05 10:54:26.651]
Read request for file <wr840nv3_en_tp_recovery.bin>. Mode octet [20/05 10:54:26.652]
File <wr840nv3_en_tp_recovery.bin> : error 2 in system call CreateFile The system cannot find the file specified. [20/05 10:54:26.652]
Connection received from 192.168.0.86 on port 3496 [20/05 10:54:29.851]
Read request for file <wr840nv3_en_tp_recovery.bin>. Mode octet [20/05 10:54:29.851]
File <wr840nv3_en_tp_recovery.bin> : error 2 in system call CreateFile The system cannot find the file specified. [20/05 10:54:29.851]
Connection received from 192.168.0.86 on port 3496 [20/05 10:54:33.051]
Read request for file <wr840nv3_en_tp_recovery.bin>. Mode octet [20/05 10:54:33.051]
File <wr840nv3_en_tp_recovery.bin> : error 2 in system call CreateFile The system cannot find the file specified. [20/05 10:54:33.051]
```
## Downloads
- [tftpd64.exe](https://github-production-release-asset-2e65be.s3.amazonaws.com/120207563/beb47a9e-0999-11e8-995a-5bd13580105c?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20180520%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20180520T174426Z&X-Amz-Expires=300&X-Amz-Signature=efc1da2adc550629cdebe273469eade15bc008af8fb83db7288e118fab02c430&X-Amz-SignedHeaders=host&actor_id=29806845&response-content-disposition=attachment%3B%20filename%3DTftpd64-4.60-setup.exe&response-content-type=application%2Foctet-stream)
- [TFTP Releases](https://github.com/peacepenguin/tftpd64/releases)


