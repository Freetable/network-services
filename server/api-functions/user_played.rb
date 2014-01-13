post '/api/user_played' do
  my_fields = [ 'wwuserid' ]
  values = []
    fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
query_db('user_played', values).to_json
end

