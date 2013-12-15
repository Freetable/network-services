post '/api/move_file_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'wwfileid', 'pl_from', 'pl_to' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('move_file_playlist', values).to_json
end

