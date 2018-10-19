clear
echo "  _______                     ________        __"
echo " |       |.-----.-----.-----.|  |  |  |.----.|  |"_
echo " |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|"
echo " |_______||   __|_____|__|__||________||__|  |____|"
echo "          |__| W I R E L E S S   F R E E D O M"
echo " --------------------------------------------------"
echo "             https://github.com/chankruze          "
echo " --------------------------------------------------"
git clone https://www.github.com/openwrt/openwrt -b openwrt-18.06
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
make defconfig
make download
make -j4
