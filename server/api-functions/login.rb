# login
# nickname, password in 
# wwuserid, sessionid out
post '/api/login' do
  if(params['nickname'].nil? || params['password'].nil?) 
  	'-0'
  else
  	query_db('validate_user',params['nickname'],params['password']).to_json
	end
end

