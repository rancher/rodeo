lint:
	ct lint

install:
	ct install

install-all:
	helm upgrade --install bookinfo charts/bookinfo -n bookinfo --create-namespace
	helm upgrade --install loki charts/loki -n loki --create-namespace
	helm upgrade --install mssql charts/mssql -n mssql --create-namespace
	helm upgrade --install mysql-operator-orc charts/mysql-operator -n mysql-operator-orc --create-namespace
	helm upgrade --install nfs-server-provisioner charts/nfs-server-provisioner -n nfs-server-provisioner --create-namespace
	helm upgrade --install nginx charts/nginx -n nginx --create-namespace
	helm upgrade --install online-boutique charts/online-boutique -n online-boutique --create-namespace
	helm upgrade --install quake-kube charts/quake-kube -n quake-kube --create-namespace
	helm upgrade --install rancher-demo charts/rancher-demo -n rancher-demo --create-namespace
	helm upgrade --install wordpress charts/wordpress -n wordpress --create-namespace