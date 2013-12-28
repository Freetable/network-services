# 
post '/api/create_user' do
	#TO-DO 1
	# => call create_wwuserid()
	# => returns wwuserid and sessionid

	#TO-DO 2
	# => call set_user_nickname(uid, nickname, sid)
	# => returns?

	#TO-DO 3
	# => call recover_password(email)
	my_fields = [ 'email' ]
	values = []
	my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
	query_db('recover_password', values).to_json
end
