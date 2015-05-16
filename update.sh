#!/bin/bash
git pull
git submodule init
git submodule foreach git pull origin master

sudo apt-get install -y ruby-dev vim-gtk python-flake8 ack-grep

pushd "bundle/Command-T/ruby/command-t"
ruby extconf.rb
make
popd
