post '/api/set_nickname' do
  fields 	= [ 'wwuserid', 'sessionid', 'nickname' ]
	types		= [ 'uuid', 'uuid', 'username' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_user_nickname', values).to_json
	end
end

