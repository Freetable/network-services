post '/api/get_servers' do
  my_fields = [ 'wwfileid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('get_file_serverlist', values).to_json
end

