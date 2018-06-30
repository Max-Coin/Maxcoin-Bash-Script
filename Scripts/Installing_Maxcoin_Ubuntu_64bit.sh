#/bin/sh

# Updating and upgrading your machine
sudo apt-get update -y
sudo apt-get upgrade -y

# To install the required dependencies, run the following command from Ubuntu
sudo apt-get install -y git-core build-essential libssl-dev libboost-all-dev libdb-dev libdb++-dev libminiupnpc-dev libqrencode-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools qt-sdk

# Then grab the latest version of the MaxCoin source code from Github
cd ~
sudo wget https://github.com/Max-Coin/maxcoin/archive/v0.9.4.2.tar.gz
sudo tar -zxvf v0.9.4.2.tar.gz
cd maxcoin-0.9.4.2/src

# UBUNTU 16.04.3 ONLY (32 & 64 BIT)
sudo sed -i 's/<const\ CScriptID\&/<CScriptID/' rpcrawtransaction.cpp

# UBUNTU 16.04.3 64-BIT ONLY
sudo sed -i 's/\/usr\/lib\/libminiupnpc.a/\/usr\/lib\/x86_64-linux-gnu\/libminiupnpc.a/' makefile.unix

# Building the daemon
sudo make -f makefile.unix

# debugging symbols can be removed from the binary to reduce its size. This can be done using strip:
strip maxcoind

# Then, to build the GUI, run the following commands:
cd ..
qmake maxcoin-qt.pro
make

# Setting up Maxcoin Data Folder
mkdir ~/.maxcoin/
touch ~/.maxcoin/maxcoin.conf
printf 'rpcuser=maxcoinrpc\nrpcpassword=EXAMPLERPCPASSWORDEDITTHIS\ndbcache=50\nmaxconnections=10\ntxindex=1\nreindex=1\ndebug=1' >> ~/.maxcoin/maxcoin.conf







