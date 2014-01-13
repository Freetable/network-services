# login
# nickname, password in 
# wwuserid, sessionid out
post '/api/login' do
  my_fields = [ 'nickname', 'password' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('validate_user', values).to_json
end

