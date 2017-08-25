sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
       libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
       libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
       python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

CURRETN_PATH=$(pwd)
TEMP_VIM_DIR=~/install_vim

mkdir ${TEMP_VIM_DIR}

git clone https://github.com/vim/vim.git ${TEMP_VIM_DIR}

cd ${TEMP_VIM_DIR}

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local 

make VIMRUNTIMEDIR=/usr/local/share/vim/vim80

sudo make install

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

cd ${CURRETN_PATH}
