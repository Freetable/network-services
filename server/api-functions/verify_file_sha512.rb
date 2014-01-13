post '/api/verify_file_sha512' do
  fields 	= [ 'hash' ]
	types		= [ 'sha512' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('verify_file_sha512', values).to_json
	end
end

