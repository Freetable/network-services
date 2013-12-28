post '/api/move_file_playlist' do
  my_fields = [ 'wwuserid', 'sessionid', 'wwfileid', 'pl_from', 'pl_to' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('move_file_playlist', values).to_json
end

