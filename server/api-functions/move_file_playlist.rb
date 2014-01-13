post '/api/move_file_playlist' do
  fields 	= [ 'wwuserid', 'sessionid', 'wwfileid', 'pl_from', 'pl_to' ]
	types		= [ 'uuid', 'uuid', 'uuid', 'integer', 'integer' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('move_file_playlist', values).to_json
	end
end

