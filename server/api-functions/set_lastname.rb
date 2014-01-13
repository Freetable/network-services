post '/api/set_lastname' do
  fields 	= [ 'wwuserid', 'last_name', 'sessionid' ]
	types		= [ 'uuid', 'skip', 'uuid' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_user_lastname', values).to_json
	end
end

