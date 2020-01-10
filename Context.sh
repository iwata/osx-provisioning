#!/bin/bash

PROVISIONING_HOME=$(cd $(dirname $0) && pwd)

function show_context() {
  echo "PROVISIONING_HOME=${PROVISIONING_HOME}"
}
