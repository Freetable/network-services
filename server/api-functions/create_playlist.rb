post '/api/create_playlist' do
  fields 	= [ 'wwuserid', 'sessionid', 'playlist_name' ]
	types		= [ 'uuid', 'uuid', 'string' ]

  values = check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
	  query_db('create_playlist', values).to_json
	end
end

