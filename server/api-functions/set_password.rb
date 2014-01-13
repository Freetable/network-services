post '/api/set_password' do
  my_fields = [ 'wwuserid', 'password', 'sessionid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('set_user_password', values).to_json
end
