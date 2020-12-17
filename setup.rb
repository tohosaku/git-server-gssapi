package 'apache2'
package 'git'
package 'libapache2-mod-auth-gssapi'
package 'krb5-user'

remote_file "/etc/apache2/sites-available/000-default.conf" do
  owner "root"
  group "root"
  source "000-default.conf"
end

directory "/opt/log" do
  action :create
  mode "755"
end

directory "/var/lib/git" do
  action :create
  owner "www-data"
  group "www-data"
  mode "755"
end

remote_file "/etc/kerberos.keytab" do
  owner "www-data"
  group "www-data"
  source "kerberos.keytab"
  mode "400"
end

remote_file "/etc/krb5.conf" do
  owner "root"
  group "root"
  source "krb5.conf"
  mode "644"
end

directory "/var/www/gssapi-test" do
  action :create
  owner "www-data"
  group "www-data"
  mode "755"
end

remote_file "/var/www/gssapi-test/index.html" do
  owner "www-data"
  group "www-data"
  source "index.html"
end

remote_file "/var/www/gssapi-test/env.cgi" do
  owner "www-data"
  group "www-data"
  source "env.cgi"
  mode "755"
end

execute 'enable apache2 modules' do
  command 'a2enmod auth_gssapi cgi alias env rewrite headers'
end

execute 'remove unneed directory' do
  command 'cd /var/www && rm -rf html'
end
