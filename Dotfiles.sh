#!/bin/bash

cd ~/Dropbox/dotfiles
rake install
chmod 600 ~/.netrc
chmod 600 ~/.ssh/config ~/.ssh/id_boot2docker ~/.ssh/id_dsa ~/.ssh/id_rsa ~/.ssh/nopass-dsa
