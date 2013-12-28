post '/api/delete_file_from_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'wwfileid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('delete_file_from_playlist', values).to_json
end
