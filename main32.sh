# Add dependent repositories
sudo dpkg --add-architecture i386
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
add-apt-repository ppa:pikaos/ppa-deps
# Clone Upstream
tar -xf mangohud_0.6.8.orig.tar.xz -C ./
mv ./MangoHud-v0.6.8./mangohud
cp -rvf ./debian ./mangohud
cd ./mangohud

# Get build deps
apt-get install build-essential -y
apt-get install crossbuild-essential-i386 lib32gcc-11-dev -y
apt-get build-dep ./ -y -a i386

# Build package
LOGNAME=root dh_make --createorig -y -l -p mangohud_0.6.8
dpkg-buildpackage -a i386

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/

