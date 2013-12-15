post '/api/create_file' do
    query_db('create_wwfileid').to_json
end
