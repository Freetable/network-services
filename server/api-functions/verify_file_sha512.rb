post '/api/verify_file_sha512' do
  my_fields = [ 'hash' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('verify_file_sha512', values).to_json
end

