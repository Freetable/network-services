post '/api/user_played' do
  fields 	= [ 'wwuserid' ]
  types		=	[ 'uuid' ]
	
	values = check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
		query_db('user_played', values).to_json
	end
end

