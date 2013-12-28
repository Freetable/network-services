# does_user_exist
# nickname, email in
# bool out
post '/api/does_user_exist' do
  my_fields = [ 'nickname', 'email' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return ['-0'=>'-0'].to_json if fail
  
	# Leave all the hard logic to SQL :)
	row = query_db('does_user_exist', values ).shift
	
  uid, nickname, email = ''

  if(!row.nil?)
  	uid      = row['WWUSERID'];
    nickname = row['nickname'];
  	email    = row['email'];
  else
  	return ("-0".to_json);
	end

  # Validate
	return ("-0".to_json) if uid.nil?

  #TO-DO
  # DONE PUBLIC_URL_RR This will always be gatekeeper.freetable.info BUT it should be a constant so => server_url	= get_serverurl();  -- from db config table
  return("1".to_json)
end
