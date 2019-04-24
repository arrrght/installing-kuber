[kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way)

1. Make a clean debian installation on 3 controllers and 3 workers

2. Copy ssh keys to root

```
ssh-copy-id user@[host]
ssh user@[host]
cp /home/user/.ssh /root/
^D
```

3. Edit inventories/office/hosts

4. Check it

```
ansible -i inventories/office all -m ping
```

5. Get tool, generate certs

```
pushd roles/initial/files
./get_tools.sh
```

6. Copy tools/{cfssl, cfssljson, kubectl} to your /usr/local/bin, chmod +x

7. Generate certs and configs

```
cd certs
./00-gen-all-certs.sh
cd ../configs
./00-gen-all-configs.sh
cd ../../../etcd/files
./00-get-etcd.sh

popd
```

6. Play some

```
ansible-playbook -i inventories/office all.yml
```

7. Handy game

```
cd configs
kubectl --kubeconfig admin.kubeconfig get componentstatuses
kubectl --kubeconfig admin.kubeconfig apply -f rbac-role.yaml
kubectl --kubeconfig admin.kubeconfig apply -f rbac-role-bind.yaml

```
