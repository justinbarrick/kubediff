#!/bin/ash

mkdir ~/.kube/
echo "$KUBECONFIG" |base64 -d > ~/.kube/config

kubediff "$@"
