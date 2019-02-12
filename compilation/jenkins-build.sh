clear
echo "  _______                     ________        __"
echo " |       |.-----.-----.-----.|  |  |  |.----.|  |"_
echo " |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|"
echo " |_______||   __|_____|__|__||________||__|  |____|"
echo "          |__| W I R E L E S S   F R E E D O M"
echo " --------------------------------------------------"
echo "             https://github.com/chankruze          "
echo " --------------------------------------------------"
git clone https://github.com/openwrt/openwrt.git -b openwrt-18.06
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
curl -O https://raw.githubusercontent.com/chankruze/TL-WR840N/configs/TL_WR840N_v2_defconfig
rm -rf .config
mv TL_WR840N_v2_defconfig .config
make download
make -j4
