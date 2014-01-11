post '/api/set_email' do
  my_fields = [ 'wwuserid', 'email', 'sessionid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return FUNCTIONFAIL if fail
  query_db('set_user_email', values).to_json
end

