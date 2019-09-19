#!/bin/sh

KUBE_VER="1.16.0"
curl -o tools/cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
chmod +x tools/cfssl
curl -o tools/cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
chmod +x tools/cfssljson

curl -o tools/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kubectl
curl -o tools/kube-apiserver https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kube-apiserver
curl -o tools/kube-controller-manager https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kube-controller-manager
curl -o tools/kube-scheduler https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kube-scheduler
curl -o tools/kube-proxy https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kube-proxy
curl -o tools/kubelet https://storage.googleapis.com/kubernetes-release/release/v${KUBE_VER}/bin/linux/amd64/kubelet

curl -Lo crictl.tgz https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.16.0/crictl-v1.16.0-linux-amd64.tar.gz
tar -xf crictl.tgz -C tools

curl -o tools/runsc https://storage.googleapis.com/gvisor/releases/nightly/latest/runsc

# little buggy
#curl -Lo tools/runc https://github.com/opencontainers/runc/releases/download/v1.0.0-rc7/runc.amd64
curl -Lo tools/runc https://github.com/opencontainers/runc/releases/download/v1.0.0-rc8/runc.amd64

curl -Lo cni-plugins-amd64.tgz https://github.com/containernetworking/plugins/releases/download/v0.8.2/cni-plugins-linux-amd64-v0.8.2.tgz
tar -xf cni-plugins-amd64.tgz -C tools

curl -Lo containerd.tgz https://github.com/containerd/containerd/releases/download/v1.2.9/containerd-1.2.9.linux-amd64.tar.gz
tar -xf containerd.tgz -C tools

