# Add dependent repositories
sudo dpkg --add-architecture i386
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
touch /etc/apt/sources.list.d/pika.list
echo 'deb https://ppa.pika-os.com/ lunar main' > /etc/apt/sources.list.d/pika.list
echo 'deb http://deb.debian.org/debian/ sid main contrib non-free non-free-firmware' > /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian/ sid main contrib non-free non-free-firmware' >> /etc/apt/sources.list
apt update
# Clone Upstream
tar -xf mangohud_0.6.8.orig.tar.xz -C ./
mv ./MangoHud-v0.6.8 ./mangohud
cp -rvf ./debian ./mangohud/
cd ./mangohud

# Get build deps
apt-get install build-essential -y
apt-get install crossbuild-essential-i386 lib32gcc-11-dev -y
apt-get build-dep ./ -y -a i386
apt-get install python3-mako -y

# Build package
dpkg-buildpackage -a i386

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/

