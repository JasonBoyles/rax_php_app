

if node[:php_app][:sslcert] == ""
  node.set[:php_app][:sslcert] = nil
  node.set[:php_app][:sslkey]     = nil
  node.set[:php_app][:sslcacert]  = nil
end

node.set[:php_app][:domain] = URI.parse(node[:php_app][:url]).host

include_recipe 'php_app'
