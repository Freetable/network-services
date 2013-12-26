get '/api/query_user/:wwuserid' do
  cache_control :public
  my_fields = [ 'wwuserid' ]
  values = []
  my_fields.each { |field| return '-0'.to_json if(params[field].nil?) ; values.push(params[field]) }
  query_db('query_user', values).to_json
end

