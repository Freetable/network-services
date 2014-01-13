post '/api/set_long_descr' do
  fields 	= [ 'wwuserid', 'long_description', 'sessionid' ]
	types		=	[ 'uuid', 'skip', 'uuid' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_user_long_descr', values).to_json
	end
end

