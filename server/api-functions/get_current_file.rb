post '/api/get_current_file' do
  fields 	= [ 'wwuserid' ]
	types		= [ 'uuid' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
		query_db('get_current_file', values).to_json
	end
end

