#!/bin/sh

./1-gen-ca.sh
./2-gen-cs.sh
./3-gen-workers.sh
./4-gen-kube-controller.sh
./5-gen-kube-proxy.sh
./6-gen-scheduler.sh
./7-gen-api-server.sh
./8-gen-service-account.sh
