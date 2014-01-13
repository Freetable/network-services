post '/api/set_model' do
  fields 	= [ 'wwuserid', 'binarydata', 'binarytype', 'sessionid'  ]
	types		=	[ 'uuid', 'binary', 'binary', 'sessionid' ]

  values 	= check_and_stack(fields, params, types)

  if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('set_model', values).to_json
	end
end

