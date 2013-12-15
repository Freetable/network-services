post '/api/user_played' do
  my_fields = [ 'wwuserid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('user_played', values).to_json
end

