#!/bin/sh

for instance in w1 w2 w3; do
  kubectl config set-cluster such-kuber-very-wow \
    --certificate-authority=../certs/ca.pem \
    --embed-certs=true \
    --server=https://10.200.16.236:6443 \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-credentials system:node:w1 \
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


