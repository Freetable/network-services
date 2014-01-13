post '/api/get_servers' do
  fields 	= [ 'wwfileid' ]
	types		= [ 'uuid' ]

  values 	=	check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('get_file_serverlist', values).to_json
	end
end

