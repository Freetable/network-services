# login
# nickname, password in 
# wwuserid, sessionid out
post '/api/login' do
  my_fields = [ 'nickname', 'password' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('validate_user', values).to_json
end

