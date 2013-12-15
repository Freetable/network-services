# logout
# wwuserid, sessionid in
# nothing out
post '/api/logout' do
  if(params['wwuserid'].nil? || params['sessionid'].nil?)
    '-0'
  else
    query_db('invalidate_user',params['wwuserid'],params['sessionid']).to_json
  end
end


