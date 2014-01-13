post '/api/set_short_descr' do
  fields 	= [ 'wwuserid', 'short_description', 'sessionid' ]
  types		= [ 'uuid', 'skip', 'uuid' ]

	values	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_user_short_descr', values).to_json
	end
end

