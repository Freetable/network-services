post '/api/set_sprite' do
  my_fields = [ 'wwuserid', 'binarydata', 'binarytype', 'sessionid'  ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('set_sprite', values).to_json
end

