post '/api/verify_file_sha1' do
  my_fields = [ 'hash' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('verify_file_sha1', values).to_json
end

