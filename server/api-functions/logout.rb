# logout
# wwuserid, sessionid
# nothing out
post '/api/logout' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "POST"

  fields 	= [ 'wwuserid', 'sessionid' ]
	types 	= [ 'uuid', 'uuid' ]
	
  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
	  query_db('invalidate_user', values).to_json
	end
end


