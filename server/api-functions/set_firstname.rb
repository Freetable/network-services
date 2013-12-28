post '/api/set_firstname' do
  my_fields = [ 'wwuserid', 'first_name', 'sessionid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('validate_user', values).to_json
end

