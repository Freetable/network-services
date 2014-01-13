get '/api/query_user.pls' do
  response.headers["Access-Control-Allow-Origin"]  = "*"
  response.headers["Access-Control-Allow-Methods"] = "GET"
  #  cache_control :public, :max_age => 900
  fields 	= ['wwuserid']
	types 	= [ 'uuid' ]

  values  = check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('query_user', values).to_json
	end
end

