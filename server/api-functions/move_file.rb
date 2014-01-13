post '/api/move_file' do
  my_fields = [ 'wwuserid', 'sessionid', 'from', 'to' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('move_file', values).to_json
end

