# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
touch /etc/apt/sources.list.d/pika.list
echo 'deb https://ppa.pika-os.com/ lunar main' > /etc/apt/sources.list.d/pika.list
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
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
