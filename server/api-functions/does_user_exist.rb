# does_user_exist
# nickname, email in
# bool out
post '/api/does_user_exist' do
  my_fields = [ 'nickname', 'email' ]
  values = []
  
	my_fields.each { |field| return false if (params[field].nil?) ; values.push(params[field]) }

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
