get '/api/get_sprite/:wwuserid' do
  cache_control :public
  fields 	= [ 'wwuserid' ]
	types		= [ 'uuid' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('get_sprite', values).to_json
	end
end

