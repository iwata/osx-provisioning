#!/bin/bash

cd ~/Dropbox/dotfiles
rake install
chmod 600 ~/.netrc
chmod 600 ~/.ssh/config ~/.ssh/id_github ~/.ssh/id_dsa ~/.ssh/id_rsa ~/.ssh/nopass-dsa ~/.ssh/google_compute_engine ~/.ssh/id_ed25519

tic ~/.config/xterm-256color-italic.terminfo
