post '/api/set_lastname' do
  my_fields = [ 'wwuserid', 'last_name', 'sessionid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('set_user_lastname', values).to_json
end

