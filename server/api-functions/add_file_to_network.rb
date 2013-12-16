post '/api/add_file_to_network' do
  my_fields = [ 'wwfileid', 'random_hash', 'title', 'artist', 'album', 'year', 'md5', 'sha1', 'sha512' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('add_file_to_network', values).to_json
end



