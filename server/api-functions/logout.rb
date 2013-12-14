# logout
# wwuserid, sessionid in
# nothing out
post '/api/logout' do
  @@dbh.fetch('CALL invalidate_user(?, ?)', params['wwuserid'], params['sessionid']).all.to_json
end

