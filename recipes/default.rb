#
# Cookbook:: ariel-test
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.




service 'xntpd' do
  supports status: true
  action [:enable, :start]
  #not_if { 1 == 1 }
end

file '/tmp/something' do
  owner 'root'
  group 'root'
  mode '0755'
  content node['memory']['total']
  action :create
end
