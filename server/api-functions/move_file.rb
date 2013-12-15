post '/api/move_file' do
  my_fields = [ 'wwuserid', 'sessionid', 'from', 'to' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('move_file', values).to_json
end

