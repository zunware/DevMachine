#!/usr/bin/env bash
echo "===== Starting to get Ready ======"
pwd
export DEBIAN_FRONTEND=noninteractive

# apt-get update
# apt-get upgrade

apt-get install -y git build-essential

apt-get install -y nginx postgresql libpq-dev libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl lua5.1 liblua5.1-dev

mkdir devCode; cd devCode
pwd

# Download openresty
echo "Downloading openresty"
wget -q "https://openresty.org/download/openresty-1.11.2.1.tar.gz"
echo "Done downloading openresty"

# Extract and install
sudo tar xvf "openresty-1.11.2.1.tar.gz"
cd "openresty-1.11.2.1"
./configure --with-pcre-jit --with-http_postgres_module --with-http_iconv_module
make
make install
rm "openresty-1.11.2.1.tar.gz"

# Install luarocks
# http://luarocks.org/releases
cd ~/devCode 
echo "Downloading Luarocks"
wget -q "http://keplerproject.github.io/luarocks/releases/luarocks-2.4.0.tar.gz"
echo "Done donwnloading Luarocks"
tar xvf "luarocks-2.4.0.tar.gz"
cd "luarocks-2.4.0"
./configure
make build
sudo make install
rm "luarocks-2.4.0.tar.gz"
echo "Done installing luarocks"


# Install torch
git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch; bash install-deps;
./install.sh

apt-get install -y zsh

chsh -s $(which zsh) vagrant
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change the oh my zsh default theme.
# sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="3den"/g' ~/.zshrc
zsh

echo "===== Done getting ready ====="
