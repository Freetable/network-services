post '/api/set_email' do
  fields 	= [ 'wwuserid', 'email', 'sessionid' ]
	types		= [ 'uuid', 'email', 'uuid' ]

  values	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_user_email', values).to_json
	end
end

