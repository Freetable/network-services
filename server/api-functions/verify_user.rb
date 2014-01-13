get '/api/verify_user.pls' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "GET"
#  cache_control :public, :max_age => 60
  etag ''

  fields = [ 'wwuserid', 'sessionid' ]
  types = [ 'uuid', 'uuid' ]
  
  values = check_and_stack(fields, params, types)

  if(values.nil?) 
    return FUNCTIONFAIL if fail
  else
    query_db('verify_user', values).to_json	
  end

end

