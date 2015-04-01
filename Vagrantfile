# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrant configuration
#################################

  Vagrant.configure("2") do |config|
    # Enable Berkshelf support
    config.berkshelf.enabled = true

 
    config.omnibus.chef_version = :latest
    # Define VM box to use
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"

    # IP Address for the host only network, change it to anything you like
    # but please keep it within the IPv4 private network range
#    ip_address = "192.168.56,100"
        # Set share folder
#    config.vm.synced_folder "./" , "/var/www/" + project_name + "/", :mount_options => ["dmode=777", "fmode=666"]



    # The project name is base for directories, hostname and alike
    project_name = "shady"

    # Make sure that the newest version of Chef have been installed
    config.vm.provision :shell, :inline => "apt-get update -qq && apt-get install nginx php5 --yes"

    # Use hostonly network with a static IP Address and enable
    # hostmanager so we can have a custom domain for the server
    # by modifying the host machines hosts file
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.vm.define project_name do |node|
      node.vm.hostname = project_name + ".local"
#      node.vm.network :private_network, ip: ip_address
      node.hostmanager.aliases = [ "www." + project_name + ".local" ]
    end
    config.vm.provision :hostmanager

    # Enable and configure chef solo
    config.vm.provision :chef_solo do |chef|
#      chef.add_recipe "app::packages"
#      chef.add_recipe "app::web_server"
      chef.add_recipe "app::vhost"
      chef.json = {
        :app => {
          # Project name
          :name           => project_name,
          # Port Number
          :server_port     => "8080",
         
          # Server name and alias(es) for Apache vhost
          :server_name    => project_name + ".local",
          :server_aliases =>  [ "www." + project_name + ".local" ],

          # Document root for Apache vhost
          :docroot        => "/var/www/" + project_name + "/public",

          # General packages
          :packages   => %w{ vim git screen curl },

          # PHP packages
#          :php_packages   => %w{ php5-mysqlnd php5-curl php5-mcrypt php5-memcached php5-gd },
        }
      }
    end
  end
