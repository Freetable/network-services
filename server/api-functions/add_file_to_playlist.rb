post '/api/add_file_to_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'wwfileid', 'file_network' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('add_file_to_playlist', values).to_json
end

