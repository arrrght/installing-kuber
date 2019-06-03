#!/bin/sh
kubectl config set-cluster such-kuber-very-wow \
   --certificate-authority=../certs/ca.pem \
   --embed-certs=true \
   --server=https://94.130.141.147:6443 \
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
