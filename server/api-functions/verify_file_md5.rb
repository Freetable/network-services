post '/api/verify_file_md5' do
  fields 	= [ 'hash' ]
	types		= [ 'md5' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('verify_file_md5', values).to_json
	end
end

