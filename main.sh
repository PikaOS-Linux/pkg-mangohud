# Add dependent repositories
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
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
