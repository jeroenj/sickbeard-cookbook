file_path = ::File.join node[:sickbeard][:install_dir], 'lib/tvdb_api/tvdb_api.py'
patch_path = File.expand_path File.join(__FILE__, '../../files/default/tvdb_api.patch')

execute 'Apply Sick Beard tvdb api patch' do
  command "patch \"#{file_path}\" \"#{patch_path}\""
  user node[:sickbeard][:user]
  group node[:sickbeard][:group]
  only_if { system "patch --silent --forward --dry-run \"#{file_path}\" \"#{patch_path}\" > /dev/null" }
end
