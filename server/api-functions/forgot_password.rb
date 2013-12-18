# forgot_password
# nick_or_email in
# bool out
post '/api/forgot_password' do
  my_fields = [ 'nick_or_email' ]
  values = []
  my_fields.each { |field| return false if (params[field].nil?) ; values.push(params[field]) }

  if (!isEmail(values)) {
  	qry   = query_db('get_email_from_nick', values).to_json
  	nick  = values;
  	name  = qry.first_name.nil? || nick 
  	email = qry.email.nil? || return false
  } else {
    qry   = query_db('get_nick_from_email', values).to_json
    nick  = qry.nickname.nil? || return false
    name  = qry.first_name.nil? || nick
    email = values;
  }

  #TO-DO
  # => server_url	= get_serverurl();  -- from db config table
  # => orig_ip		= get_originatingIP(); -- from POST data
  # => unique_hash	= (SELECT create_random_hash(128)) call and save into a column on a table for later validation

  m = Mandrill::API.new
  message = {
    :subject	=> "Password Reset on FreeTable",  
    :from_name	=> "FreeTable",  
    :text		=> "Hi #{name},

 					We received a password reset request for your FreeTable account. To reset your password, use the links below:

					Reset your password using a web browser:
					https://#{server_url}/accounts/password/reset/confirm/#{unique_hash}

					If you didn't request a password reset, you can ignore this message and your password will not be changed -- someone probably typed in your username or email address by accident.",  
    :to 		=>[  
    {  
      :email 	=> "#{email}",  
      :name  	=> "#{name}"  
    }  
    ],  
    :html		=> "<html><h1>Hi <strong>#{name}</strong></h1><br />
    				<p>We received a password reset request for your FreeTable account. To reset your password, use the links below:</p><br />

					<p><b>Reset your password using a web browser:</b></p>
					<p><a href='https://#{server_url}/accounts/password/reset/confirm/#{unique_hash}'>https://#{server_url}/accounts/password/reset/confirm/#{unique_hash}</a></p><br />

					<p>If you didn't request a password reset, you can ignore this message and your password will not be changed -- someone probably typed in your username or email address by accident.</p></html>",
    :from_email => "stephanie@nirvanadesktop.com"  
  }

  sending = m.messages.send message  

  #TO-DO
  # => logging for email fails/success -- maybe tracking these submissions?
end
