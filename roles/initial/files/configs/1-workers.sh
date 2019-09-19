#!/bin/sh

for instance in t236 t237 t238; do
  kubectl config set-cluster such-kuber-very-wow \
    --certificate-authority=../certs/ca.pem \
    --embed-certs=true \
    --server=https://10.200.15.231:6443 \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-credentials system:node:${instance} \
    --client-certificate=../certs/${instance}.pem \
    --client-key=../certs/${instance}-key.pem \
    --embed-certs=true \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-context default \
    --cluster=such-kuber-very-wow \
    --user=system:node:${instance} \
    --kubeconfig=${instance}.kubeconfig

  kubectl config use-context default --kubeconfig=${instance}.kubeconfig
done


