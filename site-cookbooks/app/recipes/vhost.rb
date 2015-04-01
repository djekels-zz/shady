#
# Cookbook Name:: app
# Recipe:: vhost
#
# Copyright 2013, Mathias Hansen
#
# Define app name
app_name = "#{node['app']['name']}"

puts "#{app_name}"

# Enable vhost
web_app app_name do
  server_port node['app']['server_port']

	puts "#{server_port}"

  server_name node['app']['server_name']

	puts "#{server_name}"

  server_aliases node['app']['server_aliases']

	puts "#{server_alias}"

  docroot node['app']['docroot']

	puts "#{docroots}"

end

# Disable default vhost config
##apache_site "000-default" do
#  enable false
#end
