post '/api/get_current_file' do
  my_fields = [ 'wwuserid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('get_current_file', values).to_json
end

