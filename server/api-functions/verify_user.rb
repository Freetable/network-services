post '/api/verify_user' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "POST"
  cache_control :public, :max_age => 60
  etag ''
  my_fields = [ 'wwuserid', 'sessionid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('verify_user', values).to_json
end

