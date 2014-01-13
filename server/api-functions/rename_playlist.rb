post '/api/rename_playlist' do
  fields 	= [ 'wwuserid', 'sessionid', 'playlist_number', 'playlist_name' ]
	types		= [ 'uuid', 'uuid', 'integer', 'skip' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('rename_playlist', values).to_json
	end
end

