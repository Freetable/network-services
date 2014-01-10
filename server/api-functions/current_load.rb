get '/api/current_load.pls' do
  response.headers["Access-Control-Allow-Origin"] = "*"
  response.headers["Access-Control-Allow-Methods"] = "GET"
  cache_control :public, :max_age => 60
  etag ''
  `uptime | awk '{ print $10; }' | sed -e 's/,//;'`
end
