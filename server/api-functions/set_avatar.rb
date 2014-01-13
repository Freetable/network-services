post '/api/set_avatar' do
  fields 	= [ 'wwuserid', 'binarydata', 'binarytype', 'sessionid'  ]
	types		= [ 'uuid', 'binary', 'binary', 'uuid' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_avatar', values).to_json
	end
end

