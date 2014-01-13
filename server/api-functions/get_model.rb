get '/api/get_model/:wwuserid' do
  cache_control :public
  fields 	= [ 'wwuserid' ]
	types		= [ 'uuid' ]
  
	values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
		query_db('get_model', values).to_json
	end
end

