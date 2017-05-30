#!/bin/bash

. Context.sh
show_context

TASK_NAME=$(basename $0)
function pa_echo () {
  echo [${TASK_NAME}] $1
}

pa_echo "Install Xcodle CLI"
sudo xcodebuild -license

cd ${PROVISIONING_HOME}/provisioning > /dev/null 2>&1

pa_echo "Doing playbook for Mac defaults"
ansible-playbook playbook_defaults.yml

pa_echo "Doing common playbook"
env HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook playbook.yml

pa_echo "Use fish as a login shell"
ansible-playbook playbook_fish.yml --ask-become-pass
fish

ansible-playbook playbook_llenv.yml
ansible-playbook playbook_misc.yml

osascript -e 'display notification "Successfull please restart or re-login" with title "osx-provisioning"'
