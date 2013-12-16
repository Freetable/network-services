post '/api/set_nickname' do
  my_fields = [ 'nickname', 'password', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('set_user_nickname', values).to_json
end

