post '/api/set_email' do
  my_fields = [ 'wwuserid', 'email', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('set_user_email', values).to_json
end

