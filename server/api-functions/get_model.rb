get '/api/get_model/:wwuserid' do
  cache_control :public
  my_fields = [ 'wwuserid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return FUNCTIONFAIL if fail
  query_db('get_model', values).to_json
end

