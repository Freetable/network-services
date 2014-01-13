post '/api/verify_file_sha1' do
  fields 	= [ 'hash' ]
	types		= [ 'sha1' ]

  values	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('verify_file_sha1', values).to_json
	end
end

