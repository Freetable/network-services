post '/api/set_current_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'playlist_number' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return FUNCTIONFAIL if fail
  query_db('playlist_number', values).to_json
end

