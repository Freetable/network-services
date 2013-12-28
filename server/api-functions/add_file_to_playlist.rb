post '/api/add_file_to_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'wwfileid', 'file_network' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('add_file_to_playlist', values).to_json
end

