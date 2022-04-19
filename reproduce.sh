#!/usr/bin/env bash

if [ -d charts ]; then rm -rf charts; fi

PIDS=()
echo "start A"
kustomize build . --enable-helm &
A=($!)
echo "start B"
kustomize build . --enable-helm &
B=($!)
wait $A
EXIT_A=$?
wait $B
EXIT_B=$?
echo "exit A $EXIT_A"
echo "exit B $EXIT_B"

