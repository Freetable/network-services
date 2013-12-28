get '/api/verify_user.pls' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "GET"
#  cache_control :public, :max_age => 60
  etag ''

  my_fields = [ 'wwuserid', 'sessionid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  query_db('verify_user', values).to_json
end

