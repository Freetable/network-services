post '/api/add_file_to_network' do
  my_fields = [ 'wwfileid', 'random_hash', 'title', 'artist', 'album', 'year', 'md5', 'sha1', 'sha512' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('add_file_to_network', values).to_json
end



