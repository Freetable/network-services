get '/api/query_user.pls' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "GET"
  cache_control :public, :max_age => 900
  my_fields = [ 'wwuserid' ]
  values = []
  my_fields.each { |field| return '-0'.to_json if(params[field].nil?) ; values.push(params[field]) }
  query_db('query_user', values).to_json
end

