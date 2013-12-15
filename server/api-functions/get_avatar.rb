get '/api/get_avatar/:wwuserid' do
  cache_control :public
  my_fields = [ 'wwuserid' ]
  values = []
  my_fields.each { |field| return '-0' if(params[field].nil?) ; values.push(params[field]) }
  query_db('get_avatar', values).to_json
end

