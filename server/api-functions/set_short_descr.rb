post '/api/set_short_descr' do
  my_fields = [ 'wwuserid', 'short_description', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('set_user_short_descr', values).to_json
end

