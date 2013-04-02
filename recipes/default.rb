#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2013, @gregoriomelo
kernel_version = `uname -r`
package "linux-image-extra-#{kernel_version}"

%w{lxc wget bsdtar curl}.each do |pkg|
  package pkg
end

bash "install_docker" do
  not_if "which #{node[:docker][:installation_folder]}/docker-master/#{node[:docker][:binary_name]}"
  user "root"
  cwd node[:docker][:installation_folder]
  code <<-EOH
    wget http://get.docker.io/builds/$(uname -s)/$(uname -m)/docker-master.tgz
    tar -xf docker-master.tgz
    echo "export PATH=\$PATH:`pwd`/docker-master" >> /etc/profile
  EOH
end
