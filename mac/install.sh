#!/bin/sh

brew_install_if_does_not_exist() {
  if ! brew list | grep "$1"; then
    echo "Installing '$1'..."
    brew install "$@"
  else
    echo "Package '$1' already exists. Skipping.."
  fi
}

brew_cask_install_if_does_not_exist() {
  if ! brew cask list | grep "$1"; then
    echo "Installing '$1'..."
    brew cask install "$@"
  else
    echo "Package '$1' already exists. Skipping.."
  fi
}

## Install Homebrew if it's not already installed
if test ! $(which brew); then
  echo "Installing Homebrew .."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
  source ~/.zshrc
  brew update
  brew upgrade
fi

brew_install_if_does_not_exist 'python'

brew_install_if_does_not_exist 'python3'

echo "Install Python Setup tools..."
curl https://bootstrap.pypa.io/ez_setup.py -o - | python

echo "Install pip2..."
easy_install pip

echo "Install virtualenv..."
pip install virtualenv

brew_install_if_does_not_exist 'tree'

brew_install_if_does_not_exist 'wget'

brew_install_if_does_not_exist 'git'

## Add global gitconfig only if it does not exist
if ! ls -al $HOME | grep ".gitconfig"; then
  echo "Adding global gitconfig.."
  wget -P $HOME https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.gitconfig
fi

brew_install_if_does_not_exist 'node'

echo "Install Rails and Bundler(Bundler installs with rails).."
gem install rails

echo "Installing the foreman..."
gem install foreman

brew_install_if_does_not_exist 'postgresql'

brew_install_if_does_not_exist 'mongo'

brew_install_if_does_not_exist 'redis'

brew_install_if_does_not_exist 'libmemcached'
brew_install_if_does_not_exist 'memcached'

brew_install_if_does_not_exist 'elasticsearch'

brew_install_if_does_not_exist 'docker'

if ! brew list | grep boot2docker; then
  brew install boot2docker
  echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
  echo 'export DOCKER_HOST=tcp://192.168.59.103:2376' >> ~/.zshrc
  echo 'export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm' >> ~/.zshrc
  echo 'export DOCKER_TLS_VERIFY=1' >> ~/.zshrc
  echo "export DOCKER_HOST=tcp://$(boot2docker ip 2> /dev/null):2375" >> ~/.zshrc
  source ~/.zshrc
else
  echo "Package boot2docker already exists. Skipping..."
fi

echo "Install docker-compose..."
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Install Heroku..."
brew_install_if_does_not_exist 'heroku-toolbelt'
gem install heroku
heroku update

echo "Install Aptible..."
gem install io-console
gem install aptible-cli

brew_install_if_does_not_exist 'cask'

brew_cask_install_if_does_not_exist 'dropbox'

brew_cask_install_if_does_not_exist 'google-chrome'

brew_cask_install_if_does_not_exist 'alfred'
