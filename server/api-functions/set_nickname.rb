post '/api/set_nickname' do
  my_fields = [ 'nickname', 'password', 'sessionid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('set_user_nickname', values).to_json
end

