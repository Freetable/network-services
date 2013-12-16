post '/api/create_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'playlist_name' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('create_playlist', values).to_json
end

