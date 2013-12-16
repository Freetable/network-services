post '/api/verify_user' do
  my_fields = [ 'wwuserid', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('verify_user', values).to_json
end

