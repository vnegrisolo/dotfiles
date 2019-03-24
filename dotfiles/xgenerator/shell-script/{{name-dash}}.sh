#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o xtrace

log() {
  echo -e "\033[${3}m${1} \033[0m=> ${2}";
}
log_info() {
  log INFO "${1}" 36;
}
log_error() {
  log ERROR "${1}" 31;
}

log_info "Hello World!"
exit 0
