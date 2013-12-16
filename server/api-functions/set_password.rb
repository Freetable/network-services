post '/api/set_password' do
  my_fields = [ 'wwuserid', 'password', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('set_user_password', values).to_json
end
