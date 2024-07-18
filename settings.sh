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

# Provisioning, admin & SSH related variables
USER=${USER:-deploy}
SERVER=${SERVER:-13.39.86.143}
SERVER_NAME=${SERVER_NAME:-www.ctrlaltdelete.com}
PORT=${PORT:-22} # the default ssh port
SSH_KEY=${SSH_KEY:-~/Documents/Code/Credentials/toy-app1-keypair.pem}
SSH_OPTIONS=${SSH_OPTIONS:-"-i $SSH_KEY -o StrictHostKeyChecking=no"}
UBUNTU_SSH_ARGS="ubuntu@$SERVER -p $PORT $SSH_OPTIONS"
APP_SSH_ARGS="$USER@$SERVER -p $PORT $SSH_OPTIONS"

# ----------------------------------------

# DNS related variables
CF_API_TOKEN="M4EoSJUf8erouwLe0SV6mNhLdG1J0skfsHFw4I9F"
ZONE_ID="8914d5652221e66de395d0d3b2a63210"
RECORD_ID1="6dc3fdb2420bd2c36d2e44eb8c2e0999"  # Record ID for ctrlaltinsure.com
RECORD_NAME1="ctrlaltinsure.com"
RECORD_ID2="00cc89e395517ddd7b6ace5d65b89876"  # Record ID for www.ctrlaltinsure.com
RECORD_NAME2="www.ctrlaltinsure.com"

# ----------------------------------------

ssh_as_ubuntu() {
  ssh $UBUNTU_SSH_ARGS $@
}

ssh_as_user() {
  ssh $APP_SSH_ARGS $@
}