post '/api/delete_file_from_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'wwfileid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('delete_file_from_playlist', values).to_json
end
