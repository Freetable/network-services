post '/api/get_playlist' do
  fields 	= [ 'wwuserid', 'sessionid', 'playlist_number' ]
  types 	= [ 'uuid', 'uuid', 'integer' ]
	
	values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('get_playlist', values).to_json
	end
end

