default[:sickbeard][:user] = 'sickbeard'
default[:sickbeard][:group] = 'sickbeard'

default[:sickbeard][:install_dir] = '/srv/apps/sickbeard'
default[:sickbeard][:config_dir] = '/etc/sickbeard'
default[:sickbeard][:data_dir] = '/media/sickbeard'

default[:sickbeard][:git_url] = 'https://github.com/midgetspy/Sick-Beard.git'
default[:sickbeard][:git_ref] = 'master'

default[:sickbeard][:settings] = {
  web_port: 8081,
  username: 'sickbeard',
  password: 'sickbeard',
  api_key: 'api_key',
  https_cert: '""',
  https_key: '""',
  directory: default[:sickbeard][:data_dir],
  nzbs_uid: 0,
  nzbs_hash: 'hash',
  sab_username: 'sab',
  sab_password: 'sab',
  sab_apikey: 'sab',
  sab_category: 'tv',
  sab_host: 'https://localhost:9090/',
  twitter_username: '""',
  twitter_password: '""',
  newznab_data: '|'
}
