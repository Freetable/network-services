post '/api/add_file_to_playlist' do
  fields 	= [ 'wwuserid', 'sessionid', 'wwfileid', 'file_network' ]
	types 	= [ 'uuid', 'uuid', 'uuid', 'integer' ]

  values 	= check_and_stack(fields, params, types)
  
	if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
		query_db('add_file_to_playlist', values).to_json
	end
end

