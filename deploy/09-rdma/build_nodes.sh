#!/bin/bash

WORKERS=2

cd ansible/
export suffix=$(head -c 16 /dev/urandom | sha1sum | cut -c1-6)

for m in $(seq 1 $WORKERS); do
  echo "  - Building node $m"
  ansible-playbook 00_prepare_setup.yaml -e "node_index=$m" -e "suffix=$suffix"
  ansible-playbook 01_prepare_nodes.yaml
done



