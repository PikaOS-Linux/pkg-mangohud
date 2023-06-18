# Clone Upstream
git clone https://github.com/flightlessmango/MangoHud -b v0.6.9-1
mv ./MangoHud ./mangohud
cp -rvf ./debian ./mangohud/
cd ./mangohud

# Get build deps
apt-get build-dep ./ -y

# Build package

LOGNAME=root dh_make --createorig -y -l -p mangohud_0.6.9.1

dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
