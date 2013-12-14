# login
# nickname, password in 
# wwuserid, sessionid out
post '/api/login' do
  @@dbh.fetch('CALL validate_user(?, ?)', params['nickname'], params['password']).all.to_json
end

