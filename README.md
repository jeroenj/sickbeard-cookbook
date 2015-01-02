sickbeard Cookbook
==================
Installs [sickbeard](http://sickbeard.com) and its required dependencies.

Requirements
------------
#### python
Python is required. It is set up as a dependency of this cookbook so it will be handled automatically.

#### git
The code is being synced from github. Git is required for checking out the code.

Attributes
----------
#### sickbeard::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sickbeard']['user']</tt></td>
    <td>String</td>
    <td>User which sickbeard will be ran as</td>
    <td>sickbeard</td>
  </tr>
  <tr>
    <td><tt>['sickbeard']['group']</tt></td>
    <td>String</td>
    <td>Group which owns the sickbeard installation</td>
    <td>sickbeard</td>
  </tr>
  <tr>
    <td><tt>['sickbeard']['install_dir']</tt></td>
    <td>String</td>
    <td>Directory where sickbeard will be installed</td>
    <td>/srv/apps/sickbeard</td>
  </tr>
  <tr>
    <td><tt>['sickbeard']['config_dir']</tt></td>
    <td>String</td>
    <td>Configuration directory</td>
    <td>/etc/sickbeard</td>
  </tr>
  <tr>
    <td><tt>['sickbeard']['data_dir']</tt></td>
    <td>String</td>
    <td>Default directory where media will be located</td>
    <td>/media/sickbeard</td>
  </tr>
  <tr>
    <td><tt>['sickbeard']['git_url']</tt></td>
    <td>String</td>
    <td>Git repository which will be checked out</td>
    <td>https://github.com/RuudBurger/CouchPotatoServer.git</td>
  </tr>
  <tr>
    <td><tt>['sickbeard']['git_ref']</tt></td>
    <td>String</td>
    <td>Git branch which will be checked out</td>
    <td>master</td>
  </tr>
  <tr>
    <td><tt>['sickbeard']['settings']</tt></td>
    <td>Hash</td>
    <td>Configuration options. Feel free to create a pull request for more custom options.</td>
    <td>
      <ul>
        <li><tt>web_port</tt></li>
        <li><tt>username</tt></li>
        <li><tt>password</tt></li>
        <li><tt>api_key</tt></li>
        <li><tt>https_cert</tt></li>
        <li><tt>https_key</tt></li>
        <li><tt>directory</tt></li>
        <li><tt>nzbs_uid</tt></li>
        <li><tt>nzbs_hash</tt></li>
        <li><tt>sab_username</tt></li>
        <li><tt>sab_password</tt></li>
        <li><tt>sab_apikey</tt></li>
        <li><tt>sab_category</tt></li>
        <li><tt>sab_host</tt></li>
        <li><tt>twitter_username</tt></li>
        <li><tt>twitter_password</tt></li>
        <li><tt>newznab_data</tt></li>
      </ul>
      Empty settings should be defined as a set of quotes. e.g. `'""'`
    </td>
  </tr>
</table>

Usage
-----
#### sickbeard::default

It installs sickbeard by checking it out from source.

#### sickbeard::tvdb_api_patch

This patches the tvdb lib to use the correct order for American Dad.
This recipe might be removed in the near future so it's not advised to use it.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
