#!/bin/sh

KUBE_VER="1.14.1"
curl -o cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
chmod +x cfssl
curl -o cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
chmod +x cfssljson

curl -o kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kubectl
curl -o kube-apiserver https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kube-apiserver
curl -o kube-controller-manager https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kube-controller-manager
curl -o kube-scheduler https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kube-scheduler
