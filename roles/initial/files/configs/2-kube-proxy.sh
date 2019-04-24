#!/bin/sh
KUBERNETES_PUBLIC_ADDRESS=10.200.16.231

kubectl config set-cluster such-kuber-very-wow \
   --certificate-authority=../certs/ca.pem \
   --embed-certs=true \
   --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
   --kubeconfig=kube-proxy.kubeconfig

kubectl config set-credentials system:kube-proxy \
  --client-certificate=../certs/kube-proxy.pem \
  --client-key=../certs/kube-proxy-key.pem \
  --embed-certs=true \
  --kubeconfig=kube-proxy.kubeconfig

kubectl config set-context default \
  --cluster=such-kuber-very-wow \
  --user=system:kube-proxy \
  --kubeconfig=kube-proxy.kubeconfig

kubectl config use-context default --kubeconfig=kube-proxy.kubeconfig
