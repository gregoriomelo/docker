#
# Cookbook Name:: docker-cookbook
# Recipe:: default
#
# Copyright 2013, @gregoriomelo
%w{lxc wget bsdtar curl linux-image-extra-`uname -r`}.each do |pkg|
  package pkg
end

bash "install_docker" do
  not_if "which #{node[:docker][:installation_folder]}/#{node[:docker][:binary_name]}"
  user "root"
  cwd "/opt/"
  code <<-EOH
    wget http://get.docker.io/builds/$(uname -s)/$(uname -m)/docker-master.tgz
    tar -xf docker-master.tgz
  EOH
end
