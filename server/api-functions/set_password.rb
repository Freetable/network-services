post '/api/set_password' do
  fields 	= [ 'wwuserid', 'password', 'sessionid' ]
  types		= [ 'uuid', 'sha512', 'uuid' ]

	values	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_user_password', values).to_json
	end
end
