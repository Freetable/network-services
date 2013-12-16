post '/api/get_playlists' do
  my_fields = [ 'wwuserid', 'sessionid', ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('get_playlists', values).to_json
end

