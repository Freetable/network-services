post '/api/get_servers' do
  my_fields = [ 'wwfileid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('get_file_serverlist', values).to_json
end

