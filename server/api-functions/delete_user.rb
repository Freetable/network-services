post '/api/delete_user' do
  my_fields = [ 'wwuserid', 'password' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('delete_user', values).to_json
end

