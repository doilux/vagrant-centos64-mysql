# service iptables stop
service "iptables" do
    action [:stop, :disable]
end

# UnInstall mysql-libs
package "mysql-libs" do
    action :remove
end

# Install dependent package
dependent_packages = %w[
    rsync wget gcc glibc
]

dependent_packages.each do |pkg|
    package pkg do
        action :install
    end
end


remote_file "/tmp/#{node['mysql']['file_name']}" do
  source "#{node['mysql']['remote_uri']}"
end

bash "install_mysql" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar xf "#{node['mysql']['file_name']}"
  EOH
end

node['mysql']['rpm'].each do |rpm|
  package rpm[:package_name] do
    action :install
    provider Chef::Provider::Package::Rpm
    source "/tmp/#{rpm[:rpm_file]}"
  end
end
