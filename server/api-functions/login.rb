# login
# nickname, password in 
# wwuserid, sessionid out
post '/api/login' do
  fields 	= [ 'nickname', 'password' ]
	types		= [ 'uuid', 'sha512' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('validate_user', values).to_json
	end
end

