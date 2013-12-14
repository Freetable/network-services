# login
# nickname, password in 
# wwuserid, sessionid out
post '/api/login' do
  results = ''
  if(params['nickname'].nil? || params['password'].nil?) 
    results = '-2'
  else
    @@dbh_pool.with { |dbh| results = dbh.query("CALL validate_user('#{dbh.escape(params['nickname'])}', '#{dbh.escape(params['password'])}')").to_a; reset_dbh(dbh) }
  end
  results.to_json

end

