post '/api/set_firstname' do
  my_fields = [ 'wwuserid', 'first_name', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('validate_user', values).to_json
end

