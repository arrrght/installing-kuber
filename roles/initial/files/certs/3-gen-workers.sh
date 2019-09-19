#!/bin/bash

names=(t236 t237 t238)
ips=(10.200.15.236 10.200.15.237 10.200.15.238)

for item in ${!names[*]}; do
	name=${names[$item]}
	ip=${ips[$item]}
	cat > ${name}-csr.json <<EOF
{
  "CN": "system:node:${name}",
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
