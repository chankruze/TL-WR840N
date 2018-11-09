clear
echo "  _______                     ________        __"
echo " |       |.-----.-----.-----.|  |  |  |.----.|  |"_
echo " |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|"
echo " |_______||   __|_____|__|__||________||__|  |____|"
echo "          |__| W I R E L E S S   F R E E D O M"
echo " --------------------------------------------------"
echo "             https://github.com/chankruze          "
echo " --------------------------------------------------"
echo " "
echo "Preparing Resources ..........."
git clone https://www.github.com/openwrt/openwrt -b openwrt-18.06
cd openwrt
echo " "
echo "Updating Sources .............."
echo " "
./scripts/feeds update -a
./scripts/feeds install -a
echo " "
echo "Configuring Build ............."
echo " "
wget https://raw.githubusercontent.com/chankruze/TL-WR840N/configs/TL_WR840N_v3_defconfig
rm .config
mv TL_WR840N_v3_defconfig* .config
make defconfig
echo " "
echo "Downloading Latest Packages ............"
echo " "
make download
echo " "
echo "Compilation Started ............."
echo " "
make -j4
