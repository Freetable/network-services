post '/api/delete_user' do
  fields 	= [ 'wwuserid', 'password' ]
	types		= [ 'uuid', 'sha512' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('delete_user', values).to_json
	end
end

