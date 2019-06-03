#!/bin/sh

kubectl config set-cluster such-kuber-very-wow \
  --certificate-authority=../certs/ca.pem \
  --embed-certs=true \
  --server=https://94.130.141.147:6443 \
  --kubeconfig=admin.kubeconfig

kubectl config set-credentials admin \
  --client-certificate=../certs/admin.pem \
  --client-key=../certs/admin-key.pem \
  --embed-certs=true \
  --kubeconfig=admin.kubeconfig

kubectl config set-context default \
  --cluster=such-kuber-very-wow \
  --user=admin \
  --kubeconfig=admin.kubeconfig

kubectl config use-context default --kubeconfig=admin.kubeconfig
