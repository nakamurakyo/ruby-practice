####################################
# net_ldapのサンプル

### Module

# module Activedirectory
#   def authentication(upn, pass)
#     base = []
#     config = getConfig 
#     upn[/(?!.*@).*/].split('.').each { |dc_data| base << "dc=#{dc_data}" }
# 
#     conn = Net::LDAP.new host: config['host'], port: config['port'], base: base.join(','),
#                          auth: { username: upn, password: pass, method: :simple }
# 
#     conn if conn.bind
#   rescue => e
#     Rails.logger.error("Ldap error is #{e}")
#     raise e
#   end
# end

### Rake タスク

# desc 'ldap user no suffix test'
# task :test2 do
#   conn = Activedirectory.authentication('name@example.com', 'my_password_test')
#   root_dse = conn.search_root_dse
#   
#   require 'pp'
#   pp root_dse.instance_variable_get('@myhash').keys
# end