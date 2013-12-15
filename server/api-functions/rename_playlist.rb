post '/api/rename_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'playlist_number', 'playlist_name' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('rename_playlist', values).to_json
end

