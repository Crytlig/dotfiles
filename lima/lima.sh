#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"



command=$1
name=$2

if [[ -z $name ]]; then
  echo "name not provided as second argument"
  exit 1
fi;


if [[ "$command" != "create" ]] && [[ "$command" != "delete" ]]; then
  echo "command should be create or delete. Found $command"
  exit 1
fi;




if [[ "$command" == "create" ]]; then
  echo -e "${YELLOW}creating lima-vm with $2 template"
  sleep 1
  cat ./mise.lima.yaml | limactl create --name=$2 - && limactl start $2 --mount-only .:w
fi

if [[ "$command" == "delete" ]]; then
  echo -e "${YELLOW}deleting lima-vm with template"
  sleep 1
  limactl stop $2 -f && limactl delete $2
fi

# Exec with limactl shell mise
#
# start with mount only
# limactl start mise --mount-only .:w
