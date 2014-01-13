post '/api/set_short_descr' do
  my_fields = [ 'wwuserid', 'short_description', 'sessionid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('set_user_short_descr', values).to_json
end

