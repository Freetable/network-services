# login
# nickname, password in 
# wwuserid, sessionid out
post '/api/login' do
#  @@dbh.fetch('CALL validate_user(?, ?)', params['nickname'], params['password']).all.to_json
results = ''
@@dbh_pool.with do |dbh|
	results = dbh.query("CALL validate_user('#{dbh.escape(params['nickname'])}', '#{dbh.escape(params['password'])}')") 
	while dbh.next_result
  	dbh.store_result rescue ''
		end
	end

results.to_a.to_json
end

