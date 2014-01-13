post '/api/add_file_to_network' do
  fields 	= [ 'wwfileid', 'random_hash', 'title', 'artist', 'album', 'year', 'md5', 'sha1', 'sha512' ]
	types 	= [ 'uuid', 'uuid', 'skip', 'skip', 'skip', 'year', 'md5', 'sha1', 'sha512' ]
  
	values 	= check_and_stack(fields, params, types)

   if(values.nil?) 
    return Freetable::FUNCTIONFAIL
  else
  	query_db('add_file_to_network', values).to_json
	end
end



