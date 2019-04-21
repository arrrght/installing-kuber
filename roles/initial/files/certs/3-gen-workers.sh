#!/bin/bash

names=(w1 w2 w3)
ips=(10.200.16.231 10.200.16.232 10.200.16.233)

for item in ${!names[*]}; do
	name=${names[$item]}
	ip=${ips[$item]}
	cat > ${name}-csr.json <<EOF
{
  "CN": "system:node:${instance}",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "RU",
      "L": "Yekaterinburg",
      "O": "system:nodes",
      "OU": "Such kuber, very wow",
      "ST": "SVR"
    }
  ]
}
EOF

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=${name},${ip} \
  -profile=kubernetes \
  ${name}-csr.json | cfssljson -bare ${name}

done
