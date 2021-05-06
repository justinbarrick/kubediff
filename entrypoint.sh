#!/bin/ash

mkdir ~/.kube/
echo "$KUBE_CONFIG" |base64 -d > ~/.kube/config

kubediff --no-error-on-diff "$@"
