#!/bin/bash

cd ~/Dropbox/dotfiles
rake install
chmod 600 ~/.netrc
chmod 600 ~/.ssh/*
