post '/api/set_long_descr' do
  my_fields = [ 'wwuserid', 'long_description', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('set_user_long_descr', values).to_json
end

