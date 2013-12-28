post '/api/delete_user' do
  my_fields = [ 'wwuserid', 'password' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('delete_user', values).to_json
end

