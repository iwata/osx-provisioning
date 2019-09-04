#!/bin/bash

. Context.sh
show_context

TASK_NAME=$(basename $0)
function pa_echo () {
  echo [${TASK_NAME}] $1
}


cd ${PROVISIONING_HOME}/provisioning > /dev/null 2>&1

pa_echo "Doing playbook for Mac defaults"
ansible-playbook playbook_defaults.yml

pa_echo "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

pa_echo "Doing common playbook"
env HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook playbook.yml

pa_echo "Sudo tasks"
ansible-playbook playbook_sudo.yml --ask-become-pass

pa_echo "Install LL modules"
ansible-playbook playbook_llenv.yml
pa_echo "Misc. tasks"
ansible-playbook playbook_misc.yml

osascript -e 'display notification "Successfull please restart or re-login" with title "osx-provisioning"'
