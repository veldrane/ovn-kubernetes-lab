#!/bin/bash

WORKERS=4

cd ansible/

echo "Building vms for student $i"
echo "  - Building master"
ansible-playbook 00_prepare_setup.yaml -e "student=0" -e "k8s_role=master" -e "node_index=1"
ansible-playbook 01_prepare_nodes.yaml
ansible-playbook 02_configure_master.yaml
ansible-playbook 03_deploy_master.yaml
for m in $(seq 1 $WORKERS); do
  echo "  - Building worker $m"
  ansible-playbook 00_prepare_setup.yaml -e "student=0" -e "k8s_role=worker" -e "node_index=$m"
  ansible-playbook 01_prepare_nodes.yaml
  ansible-playbook 04_configure_worker.yaml
  ansible-playbook 05_deploy_worker.yaml
done
ansible-playbook 06_send_cfg.yaml



