#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2013, @gregoriomelo, @sergegebhardt
kernel_version = `uname -r`
package "linux-image-extra-#{kernel_version}"

binary_name = "docker"
tarball = "docker-master.tgz"
tarball_path = "#{Chef::Config[:file_cache_path]}/#{tarball}"
unames = `uname -s`.strip
unamem = `uname -m`.strip
tarball_url = "http://get.docker.io/builds/#{unames}/#{unamem}/#{tarball}"

%w{lxc wget bsdtar curl}.each do |pkg|
  package pkg
end

directory node[:docker][:install_dir] do
    user "root"
    action :create
end

remote_file tarball_path do
    source tarball_url
    notifies :run, "execute[install_docker]", :immediately
end

execute "install_docker" do
    not_if { ::File.exists?("#{node[:docker][:install_dir]}/#{binary_name}") }
    user "root"
    command "tar -xf #{tarball_path} --strip-components 1 -C #{node[:docker][:install_dir]}"
end

ruby_block "append to PATH" do
    block do
        file = Chef::Util::FileEdit.new("/etc/profile")
        file.insert_line_if_no_match("/:#{node[:docker][:install_dir]}/", "export PATH=\$PATH:#{node[:docker][:install_dir]}")
        file.write_file
    end
end
