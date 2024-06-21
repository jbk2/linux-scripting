#!/usr/bin/env bash
set -euo pipefail

# ----------------------------------------

INFO="\033[0;32m"  # Green
SUCCESS="\033[1;32m"  # Green bold
ALERT="\033[0;34m"    # Blue
WARNING="\033[0;33m"  # Yellow
ERROR="\033[0;31m"    # Red
NC="\033[0m"          # No color

# ----------------------------------------

USER=${USER:-deploy}
SERVER=${SERVER:-13.36.100.115}
SERVER_NAME=${SERVER_NAME:-www.ctrlaltdelete.com}
PORT=${PORT:-22} # default ssh port
SSH_KEY=${SSH_KEY:-~/Documents/Code/Credentials/toy-app1-keypair.pem}
SSH_OPTIONS=${SSH_OPTIONS:-"-i $SSH_KEY -o StrictHostKeyChecking=no"}

UBUNTU_SSH_ARGS="ubuntu@$SERVER -p $PORT $SSH_OPTIONS"
APP_SSH_ARGS="$USER@$SERVER -p $PORT $SSH_OPTIONS"

ssh_as_ubuntu() {
  ssh $UBUNTU_SSH_ARGS $@
}

ssh_as_user() {
  ssh $APP_SSH_ARGS $@
}