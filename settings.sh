#!/usr/bin/env bash
set -euo pipefail

USER=deploy
PORT=22 # default ssh port
SSH_OPTIONS="-i $SSH_KEY -o StrictHostKeyChecking=no"

UBUNTU_SSH_ARGS="ubuntu@$SERVER -p $PORT $SSH_OPTIONS"
APP_SSH_ARGS="$USER@$SERVER -p $PORT $SSH_OPTIONS"

ssh_as_ubuntu() {
  ssh $UBUNTU_SSH_ARGS $@
}

ssh_as_user() {
  ssh $APP_SSH_ARGS $@
}

fail() {
  echo "Failed: $1"
  exit 1
}
