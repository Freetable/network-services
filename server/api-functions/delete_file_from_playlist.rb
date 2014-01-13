post '/api/delete_file_from_playlist' do
  fields 	= [ 'wwuserid', 'sessionid', 'wwfileid' ]
	types 	=	[ 'uuid', 'uuid', 'uuid' ]

  values 	=	check_and_stack(fields, params, types) 

	if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('delete_file_from_playlist', values).to_json
	end
end
