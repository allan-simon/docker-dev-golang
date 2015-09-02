# -*- mode: ruby -*-
# vi: set ft=ruby :

## Define some app-specific stuff to be used later during provisioning: ##
app_vars = {
  APPUSER: 'vagrant', #externalized so that we can use ansible without vagrant
  DBNAME: 'sentencealigner',
  DBUSER: 'vagrant',
  DBPASSWORD: 'sentence-aligner'
}
# ansible_verbosity = 'vvvv'
##########################################################################

#Fix for people with strange locale settings
ENV.keys.each {|k| k.start_with?('LC_') && ENV.delete(k)}

Vagrant.configure(2) do |dkr|

  dkr.vm.provider "docker" do |d|
    d.has_ssh = true
    d.build_dir = "."
  end
  system("bash genkeys.sh")

  dkr.ssh.private_key_path = "keys/vagrantssh.key"
  dkr.ssh.username = "vagrant"

  verbosity_arg = if defined? ansible_verbosity then ansible_verbosity else '' end
  dkr.vm.synced_folder "./", "/vagrant"
  dkr.vm.provision :ansible do |ansible|
    ansible.playbook = 'provisioning/site.yml'
    ansible.extra_vars = app_vars
    ansible.verbose = verbosity_arg
  end

  dkr.vm.network "forwarded_port", guest: 80, host: 8180
  dkr.vm.network "forwarded_port", guest: 8080, host: 8188
end
