# A good chunk of this installation file was referenced from mattjmorrison.
sudo apt-get install build-essential procps curl file git tmux -y

#==============
# Install all the packages
#==============
sudo chown -R $(whoami):admin /usr/local
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /root/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential
brew doctor
brew update
brew install zsh

# So we use all of the packages we are about to install
touch ~/.bashrc
echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc && source ~/.bashrc
ls -la ~/
# Install Oh-My-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


#==============
# Remove old dot flies
#==============
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/Brewfile > /dev/null 2>&1
sudo rm -rf ~/.config/helix/config.toml > /dev/null 2>&1
#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/Brewfile ~/Brewfile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/helix 
ln -s ~/dotfiles/helix/config.toml ~/.config/helix/config.toml

cd ~
brew bundle
cd -

# Install tpm and install plugins (tmux)
if [ ! -d "~/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
~/.tmux/plugins/tpm/bin/install_plugins


#==============
# Set zsh as the default shell
#==============
echo "export SHELL=`which sh`" >> ~/.bashrc
echo "zsh" >> ~/.bashrc
echo "exit" >> ~/.bashrc
echo -e "\n====== Installation Complete ======\n"
