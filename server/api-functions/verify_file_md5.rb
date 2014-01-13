post '/api/verify_file_md5' do
  my_fields = [ 'hash' ]
  values = []
  fail = false
  my_fields.each { |field| if(params[field].nil?); fail = true; break; end; values.push(params[field]) }
  return Freetable::FUNCTIONFAIL if fail
  query_db('verify_file_md5', values).to_json
end

