#!/bin/bash
sudo apt-get install python-pip ruby-dev vim.nox
sudo pip install flake8

pushd "bundle/Command-T/ruby/command-t"
ruby extconf.rb
make
popd
