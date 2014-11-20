python_pip 'pyOpenSSL'
python_pip 'cheetah'

service 'sickbeard'

user node[:sickbeard][:user] do
  system true
  shell '/bin/bash'
  home node[:sickbeard][:install_dir]
end

app_dirs = [
  node[:sickbeard][:install_dir],
  node[:sickbeard][:config_dir]
]

app_dirs.each do |dir|
  directory dir do
    recursive true
    mode 0755
    owner node[:sickbeard][:user]
    group node[:sickbeard][:group]
  end
end

git node[:sickbeard][:install_dir] do
  repository node[:sickbeard][:git_url]
  reference node[:sickbeard][:git_ref]
  action :checkout
  checkout_branch(node[:sickbeard][:git_ref]) unless node[:sickbeard][:git_ref] == 'development'
  enable_checkout node[:sickbeard][:git_ref] != 'development'
  user node[:sickbeard][:user]
  group node[:sickbeard][:group]
  notifies :restart, 'service[sickbeard]'
end

template ::File.join(node[:sickbeard][:config_dir], 'config.ini') do
  source 'config.ini.erb'
  owner node[:sickbeard][:user]
  group node[:sickbeard][:group]
  variables(
    web_port: node[:sickbeard][:settings][:web_port],
    username: node[:sickbeard][:settings][:username],
    password: node[:sickbeard][:settings][:password],
    api_key: node[:sickbeard][:settings][:api_key],
    https_cert: node[:sickbeard][:settings][:https_cert],
    https_key: node[:sickbeard][:settings][:https_key],
    directory: node[:sickbeard][:settings][:directory],
    nzbs_uid: node[:sickbeard][:settings][:nzbs_uid],
    nzbs_hash: node[:sickbeard][:settings][:nzbs_hash],
    nzbsrus_uid: node[:sickbeard][:settings][:nzbsrus_uid],
    nzbsrus_hash: node[:sickbeard][:settings][:nzbsrus_hash],
    sab_username: node[:sickbeard][:settings][:sab_username],
    sab_password: node[:sickbeard][:settings][:sab_password],
    sab_apikey: node[:sickbeard][:settings][:sab_apikey],
    sab_category: node[:sickbeard][:settings][:sab_category],
    sab_host: node[:sickbeard][:settings][:sab_host],
    twitter_username: node[:sickbeard][:settings][:twitter_username],
    twitter_password: node[:sickbeard][:settings][:twitter_password],
    newznab_data: node[:sickbeard][:settings][:newznab_data]
  )
  notifies :restart, 'service[sickbeard]'
end

link '/etc/init.d/sickbeard' do
  to ::File.join(node[:sickbeard][:install_dir], 'init.ubuntu')
  notifies :run, 'execute[sickbeard rc.d]'
end

template '/etc/default/sickbeard' do
  source 'default.erb'
  variables(
    user: node[:sickbeard][:user],
    home: node[:sickbeard][:install_dir],
    data: node[:sickbeard][:config_dir]
  )
  notifies :restart, 'service[sickbeard]'
end

execute 'sickbeard rc.d' do
  command 'update-rc.d sickbeard defaults'
  not_if { 'update-rc.d -n sickbeard defaults | grep "already existd"' }
end
