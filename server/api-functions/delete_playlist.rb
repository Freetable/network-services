post '/api/delete_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'playlist_number' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('delete_playlist', values).to_json
end

