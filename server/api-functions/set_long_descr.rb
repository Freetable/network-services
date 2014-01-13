post '/api/set_long_descr' do
  my_fields = [ 'wwuserid', 'long_description', 'sessionid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('set_user_long_descr', values).to_json
end

