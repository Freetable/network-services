post '/api/verify_file_sha512' do
  my_fields = [ 'wwfileid', 'hash' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('verify_file_sha512', values).to_json
end

