#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"



command=$1


if [[ "$command" != "create" ]] && [[ "$command" != "delete" ]]; then
  echo "command should be create or delete. Found $command"
  exit 0
fi;


if [[ "$command" == "create" ]]; then
  echo -e "${YELLOW}creating lima-vm with mise template"
  sleep 1
  cat mise.yaml | limactl create --name=mise - && limactl start mise --mount-only .:w
fi

if [[ "$command" == "delete" ]]; then
  echo -e "${YELLOW}deleting lima-vm with mise template"
  sleep 1
  limactl stop mise -f && limactl delete mise
fi

# Exec with limactl shell mise
#
# start with mount only
# limactl start mise --mount-only .:w
