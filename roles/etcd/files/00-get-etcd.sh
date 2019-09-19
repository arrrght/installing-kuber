#!/bin/sh

curl -Lo etcd.tgz https://github.com/etcd-io/etcd/releases/download/v3.4.1/etcd-v3.4.1-linux-amd64.tar.gz
tar -xf etcd.tgz --wildcards "*/etcd" --no-anchored -C ./ --strip-components=1
tar -xf etcd.tgz --wildcards "*/etcdctl" --no-anchored -C ./ --strip-components=1
