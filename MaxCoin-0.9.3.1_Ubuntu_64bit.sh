sudo apt-get update -y
sudo apt-get install -y git-core build-essential libssl-dev libboost-all-dev libdb-dev libdb++-dev libminiupnpc-dev libqrencode-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools qt-sdk
cd ~
wget https://github.com/Max-Coin/maxcoin/archive/v0.9.3.1.tar.gz
tar -zxvf v0.9.3.1.tar.gz
cd maxcoin-0.9.3.1/src/
sudo sed -i 's/<const\ CScriptID\&/<CScriptID/' rpcrawtransaction.cpp
make -f makefile.unix
strip maxcoind
sudo mv maxcoind /usr/bin
cd ..
qmake maxcoin-qt.pro
make
mkdir ~/.maxcoin
cd ~/.maxcoin/
touch maxcoin.conf
printf 'addnode=213.179.202.19\n  addnode=wombat.dar.sh\n addnode=94.23.80.59\n  addnode=198.50.155.236\n server=1\n rpcuser=maxcoinrpc\n rpcpassword=examplepassword\n rpcport=8080'  >> maxcoin.conf
