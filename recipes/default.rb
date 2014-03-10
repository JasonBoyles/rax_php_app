
# heat string parameters can't be nil; if the field is empty, they are
# passed as empty strings. php_app expects nils for optional parameters,
# so here we set those to nil if they are passed as an empty string.

if node[:php_app][:repo] == ""
  node.set[:php_app][:repo] = nil
end

if node[:php_app][:deploy_key] == ""
  node.set[:php_app][:deploy_key] = nil
end

if node[:php_app][:sslcert] == ""
  node.set[:php_app][:sslcert] = nil
  node.set[:php_app][:sslkey]     = nil
  node.set[:php_app][:sslcacert]  = nil
end

node.set[:php_app][:domain] = URI.parse(node[:php_app][:url]).host

include_recipe 'php_app'
