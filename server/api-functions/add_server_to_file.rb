post '/api/add_server_to_file' do
  my_fields = [ 'wwfileid', 'url' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('add_server_to_filelist', values).to_json
end

