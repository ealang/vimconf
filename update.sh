#!/bin/bash
git submodule init
git submodule update

sudo apt-get install -y vim-gtk python-flake8 ack-grep exuberant-ctags
