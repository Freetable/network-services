post '/api/set_firstname' do
  fields 	= [ 'wwuserid', 'first_name', 'sessionid' ]
	types		=	[ 'uuid', 'skip', 'uuid' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_user_firstname', values).to_json
	end
end

