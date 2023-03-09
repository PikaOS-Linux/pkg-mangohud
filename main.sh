# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
add-apt-repository ppa:pikaos/ppa-deps
# Clone Upstream
git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git -b v0.6.8
mv ./MangoHud ./mangohud
cp -rvf ./debian ./mangohud
cd ./mangohud

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p mangohud_0.6.8
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
