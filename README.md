[kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way)

1. Make a clean debian installation on 3 controllers and 3 workers

2. Copy ssh keys to root

```
ssh-copy-id user@[host]
ssh user@[host]
cp /home/user/.ssh /root/
^D
```

2. Edit inventories/office/hosts

```
pushd roles/initial/files
get_tools.sh

cd certs
00-gen-all.sh

popd

ansible-playbook all.yml -i inventories/office
```
