post '/api/add_server_to_file' do
  fields 	= [ 'wwfileid', 'url' ]
	types 	= [ 'uuid', 'string' ]
  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
		query_db('add_server_to_filelist', values).to_json
	end
end

