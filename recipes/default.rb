#
# Cookbook Name:: solr
# Recipe:: default
#
# Copyright 2013, David Radcliffe
#

if node['solr']['install_java']
  include_recipe 'apt'
  include_recipe 'java'
end

group node['solr']['group'] do
  system true
end

user node['solr']['user'] do
  home node['solr']['dir']
  gid node['solr']['group']
  comment 'SOLR Administrator'
  supports :manage_home => false
  system true
end

ark 'solr' do
  url node['solr']['url']
  version node['solr']['version']
  path node['solr']['dir']
  home_dir node['solr']['dir']
  checksum node['solr']['checksum']
  owner node['solr']['user']
  group node['solr']['group']
  action :install
end

directory node['solr']['data_dir'] do
  owner node['solr']['user']
  group node['solr']['group']
  recursive true
  action :create
end

template '/etc/init.d/solr' do
  source 'initd.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(
    :context_dir => node['solr']['context'],
    :home_dir => node['solr']['home'],
    :port => node['solr']['port'],
    :pid_file => node['solr']['pid_file'],
    :log_file => node['solr']['log_file'],
    :user => node['solr']['user'],
    :java_options => node['solr']['java_options']
  )
end

service 'solr' do
  supports :restart => true, :status => true
  action [:enable, :start]
end
