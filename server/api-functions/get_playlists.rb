post '/api/get_playlists.pls' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "POST"
  #  cache_control :public, :max_age => 15
  fields 	= [ 'wwuserid', 'sessionid' ]
	types 	= [ 'uuid', 'uuid' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('get_playlists', values).to_json
	end
end

