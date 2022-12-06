## Crear LEMP
### Paso 1. Crear y editar archivo Vagrantfile
Usamos el comando "vagrant init" desde una terminal cmd que nos creara un archivo llamado Vagrantfile.
Editamos ese archivo con un editor de texto y eliminamos la siguiente linea:
> config.vm.box = "base"

Y añadimos estas líneas que serán las que indicaran el hostname, sistema instalado, tipo de red, cantidad de memoria RAM, limite de procesadores y la ubicación de sus respectivos script bash de aprovisionamiento de las 5 maquinas llamadas "Billy-balanceador", "Billy-nginx1", "Billy-nginx2", "Billy-nfs" y "Billy-mysql".

	Vagrant.configure("2") do |config|
		config.vm.define "Billy-balanceador" do |ba|
			ba.vm.hostname = "Billy-balanceador"
			ba.vm.box = "generic/debian11"
			ba.vm.network "private_network", ip:"192.168.100.2",
				virtualbox__intnet: "priv1"
			ba.vm.network "public_network"
			ba.vm.provider "virtualbox" do |v|
				v.memory = 512
				v.cpus = 1
			end
			ba.vm.provision :shell, privileged:true, path: "script-balanceador.sh"
		end
		config.vm.define "Billy-nfs" do |web3|
			web3.vm.hostname = "billy-nfs"
			web3.vm.box = "generic/debian11"
			web3.vm.network "private_network", ip:"192.168.100.5",
				virtualbox__intnet: "priv1"
			web3.vm.network "private_network", ip:"192.168.200.5",
				virtualbox__intnet: "priv2"
			web3.vm.provider "virtualbox" do |v|
				v.memory = 512
				v.cpus = 1
			end
			web3.vm.provision :shell, privileged:true, path: "script-nfs.sh"
		end
		config.vm.define "Billy-nginx1" do |web1|
			web1.vm.hostname = "Billy-apache1"
			web1.vm.box = "generic/debian11"
			web1.vm.network "private_network", ip:"192.168.100.3",
				virtualbox__intnet: "priv1"
			web1.vm.network "private_network", ip:"192.168.200.3",
				virtualbox__intnet: "priv2"
			web1.vm.provider "virtualbox" do |v|
				v.memory = 521
				v.cpus = 1
			end
			web1.vm.provision :shell, privileged:true, path: "script-nginx.sh"
		end
		config.vm.define "Billy-nginx2" do |web2|
			web2.vm.hostname = "billy-apache2"
			web2.vm.box = "generic/debian11"
			web2.vm.network "private_network", ip:"192.168.100.4",
				virtualbox__intnet: "priv1"
			web2.vm.network "private_network", ip:"192.168.200.4",
				virtualbox__intnet: "priv2"
			web2.vm.provider "virtualbox" do |v|
				v.memory = 512
				v.cpus = 1
			end
			web2.vm.provision :shell, privileged:true, path: "script-nginx.sh"
		end
		config.vm.define "Billy-mysql" do |web4|
			web4.vm.hostname = "billy-mysql"
			web4.vm.box = "generic/debian11"
			web4.vm.network "private_network", ip:"192.168.200.2",
				virtualbox__intnet: "priv2"
			web4.vm.provider "virtualbox" do |v|
				v.memory = 512
				v.cpus = 1
			end
			web4.vm.provision :shell, privileged:true, path: "script-mysql.sh"
		end
	end


### Paso2. Editamos el archivo de aprovisionamiento del balanceador
Ahora crearemos en la misma carpeta un archivo llamado "script-balanceador.sh" en el incluiremos las siguientes lineas:

- Para actualizar e instalar los paquetes necesarios:

  apt install openssl nginx -y

- Para editar la configuracion del balacneador nginx:

	cd ls ssdsdd dsfsff
	dsdssdffsd
	
	
	

