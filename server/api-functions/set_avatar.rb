post '/api/set_avatar' do
  my_fields = [ 'wwuserid', 'binarydata', 'binarytype', 'sessionid'  ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('set_avatar', values).to_json
end

