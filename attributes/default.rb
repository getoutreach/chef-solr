#
# Cookbook Name:: solr
# Attributes:: default
#
# Copyright 2013, David Radcliffe
#

default['solr']['version']  = '4.9.1'
default['solr']['url']      = "https://archive.apache.org/dist/lucene/solr/#{node['solr']['version']}/solr-#{node['solr']['version']}.tgz"
default['solr']['checksum'] = nil
default['solr']['data_dir'] = '/etc/solr'
default['solr']['dir']      = '/opt/solr'
default['solr']['context']  = '/opt/solr/example'
default['solr']['home']     = '/opt/solr/example/solr'
default['solr']['port']     = '8984'
default['solr']['pid_file'] = '/var/run/solr.pid'
default['solr']['log_file'] = '/var/log/solr.log'
default['solr']['user']     = 'solr'
default['solr']['group']    = 'solr'
default['solr']['install_java'] = true
default['solr']['java_options'] = "-Xms128m -Xmx#{(node['memory']['total'].to_i * 0.6).floor / 1024}m"
default['solr']['ulimit']   = 32768
