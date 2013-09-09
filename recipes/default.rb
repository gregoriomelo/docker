#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2013, @gregoriomelo, @sergegebhardt
kernel_version = `uname -r`

execute "apt-get-update" do
  ignore_failure true
  command "apt-get update"
end

apt_repository "docker" do
  uri "https://get.docker.io/ubuntu"
  distribution "docker"
  components ["main"]
  key "http://get.docker.io/gpg"
end

%W{linux-image-extra-#{kernel_version} lxc-docker}.each do |pkg|
  package pkg
end
