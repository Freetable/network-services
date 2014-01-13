get '/api/get_avatar/:wwuserid' do
  cache_control :public
  my_fields = [ 'wwuserid' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('get_avatar', values).to_json
end

