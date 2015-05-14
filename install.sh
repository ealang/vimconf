#!/bin/bash
sudo pip install flake8

pushd "bundle/Command-T/ruby/command-t"
ruby extconf.rb
make
popd
