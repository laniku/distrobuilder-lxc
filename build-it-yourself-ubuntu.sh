# Build the distro yourself
echo "You need go installed, without it, the LXC container will not build."
sleep 20
mkdir $HOME/distrobuilder-lxc
cd $HOME/distrobuilder-lxc
wget https://linuxcontainers.org/downloads/distrobuilder/distrobuilder-1.1.tar.gz --directory-prefix=$HOME/distrobuilder-lxc
ls
tar -xvf $HOME/distrobuilder-lxc/distrobuilder-1.1.tar.gz
sudo apt install snapd
sudo snap install distrobuilder --edge --classic
mkdir -p ContainerImages/distro/
cd ContainerImages/distro/
curl -O https://raw.githubusercontent.com/lxc/lxc-ci/master/images/debian.yaml
sudo distrobuilder build-lxc debian.yaml -o image.release=sid
cd $HOME/distrobuilder-lxc/
rm -rf distrobuilder-1.1
cd ContainerImages/distro/
ls
echo "The distro compilation is finished, it is in lxc format."
