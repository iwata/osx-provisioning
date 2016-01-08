#!/bin/bash

. Context.sh
show_context

TASK_NAME=$(basename $0)
function pa_echo () {
  echo [${TASK_NAME}] $1
}

cd ${PROVISIONING_HOME}/provisioning > /dev/null 2>&1

pa_echo "Doing common playbook"
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook playbook.yml -i hosts

# via ansible2
ansible-playbook playbook_after_brew.yml -i hosts

ANSIBLE_VERSION_MAJOR=$(echo $(ansible --version) | sed -E "s/.*[^0-9]([0-9]+\.[0-9]+\.[0-9]+).*/\1/g" | cut -d"." -f1)
echo "ANSIBLE_VERSION_MAJOR=${ANSIBLE_VERSION_MAJOR}"
if [ $ANSIBLE_VERSION_MAJOR -eq 1 ]
then
  DEFAULTS_PLAYBOOK=playbook_defaults_v1.yml
else
  DEFAULTS_PLAYBOOK=playbook_defaults.yml
fi

pa_echo "Doing playbook is ${DEFAULTS_PLAYBOOK}, which is depending ansible version"
ansible-playbook ${DEFAULTS_PLAYBOOK} -i hosts

source $HOME/.zshenv
ansible-playbook playbook_llenv.yml -i hosts

osascript -e 'display notification "Successfull please restart or re-login" with title "osx-provisioning"'
