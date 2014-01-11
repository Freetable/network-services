get '/api/get_sprite/:wwuserid' do
  cache_control :public
  my_fields = [ 'wwuserid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return FUNCTIONFAIL if fail
  query_db('get_sprite', values).to_json
end

