
#############################
# create_rpi_sumo.sh
#############################

# Download from repository.
git clone -b sumo git://git.yoctoproject.org/poky.git poky-sumo 
cd poky-sumo/ 
git clone -b sumo git://git.openembedded.org/meta-openembedded 
git clone -b sumo https://github.com/meta-qt5/meta-qt5 
git clone -b sumo git://git.yoctoproject.org/meta-security 
git clone -b sumo git://git.yoctoproject.org/meta-raspberrypi 
cd ..

mkdir rpi-sumo 
cd rpi-sumo
git clone -b sumo git://github.com/jumpnow/meta-rpi
cd ..
mkdir -p rpi-sumo/build/conf 
cd rpi-sumo/ 
cp meta-rpi/conf/local.conf.sample build/conf/local.conf 
cp meta-rpi/conf/bblayers.conf.sample build/conf/bblayers.conf 

#############################
# setenv_rpi_sumo.sh
#############################

source poky-sumo/oe-init-build-env rpi-sumo/build

#############################
# Bitbake ( Build Image )
#############################

bitbake qt5-image
