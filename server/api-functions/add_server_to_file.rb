post '/api/add_server_to_file' do
  my_fields = [ 'wwfileid', 'url' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('add_server_to_filelist', values).to_json
end

