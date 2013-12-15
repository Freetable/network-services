post '/api/set_lastname' do
  my_fields = [ 'wwuserid', 'last_name', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('set_user_lastname', values).to_json
end

