#!/bin/sh

curl -o cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
chmod +x cfssl
curl -o cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
chmod +x cfssljson
curl -o kubectl https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl
chmod +x kubectl
