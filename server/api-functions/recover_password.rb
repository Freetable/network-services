# forgot_password
# nick_or_email in
# bool out
post '/api/recover_password' do
  my_fields = [ 'nick_or_email' ]
  values = []
  
	my_fields.each { |field| return false if (params[field].nil?) ; values.push(params[field]) }

	# Leave all the hard logic to SQL :)
	row = query_db('recover_password', values ).shift
	
  uid, sid, first, last, email = ''
  client_ip = request.ip

  if(!row.nil?)
  	uid 	= row['WWUSERID'];
  	sid 	= row['sessionid'];
  	first = row['first_name'];
  	last  = row['last_name'];
  	email = row['email'];
  else
  	return ("-0".to_json);
	end

  # Validate
	return ("-0".to_json) if email.nil?

  #TO-DO
  # DONE PUBLIC_URL_RR This will always be gatekeeper.freetable.info BUT it should be a constant so => server_url	= get_serverurl();  -- from db config table
  # Done client_ip => orig_ip		= get_originatingIP(); -- from POST data  
  # Done, sessionid is set from SP and returned on db call=> unique_hash	= (SELECT create_random_hash(128)) call and save into a column on a table for later validation

  m = Mandrill::API.new MANDRILL_APIKEY
  message = {
    :subject		=> "Password Reset on FreeTable",  
    :from_name	=> "FreeTable",     
		:to 				=> [{:email	=> email, :name => "#{first} #{last}"}],  
 
    :text		=> "Hi #{first} #{last},

 					We received a password reset request for your FreeTable account. To reset your password, use the links below:

					Reset your password using a web browser:
					https://#{PUBLIC_URL_RR}/set_password?uid=#{uid}&sid=#{sid}

					If you didn't request a password reset, you can ignore this message and your password will not be changed -- someone probably typed in your username or email address by accident.",  
    :html		=> "<html><h1>Hi <strong>#{first} #{last}</strong></h1><br />
    				<p>We received a password reset request for your FreeTable account. To reset your password, use the links below:</p><br />

					<p><b>Reset your password using a web browser:</b></p>
					<p><a href='https://#{PUBLIC_URL_RR}/set_password?uid=#{uid}&sid=#{sid}'>Click Here</a></p><br />

					<p>If you didn't request a password reset, you can ignore this message and your password will not be changed -- someone probably typed in your username or email address by accident.</p></html>",
    :from_email => "recovery@freetable.info"  
  }

  m.messages.send message  

  #TO-DO
  # Done, mandrill does this transparently for us => logging for email fails/success -- maybe tracking these submissions?
  return("1".to_json)
end
