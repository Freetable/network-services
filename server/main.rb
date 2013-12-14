###############################################################################
#
# Freetable Network Services Application Layer Server
# Created By: Stephanie Sunshine
# (C) The Freetable Project
#
###############################################################################

require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/respond_to'
require 'json'
require 'mysql2'
require 'pp'

# MySql DB Hook and function when ready
# In production, the SQL DB should be on it's own pool of machines, use RRDNS for :host for failover
# Might be better to use no password and use access control lists instead here (Pondering this)

HOST_POOL = 'localhost'
DB_USER   = 'ft-net-srv'
DB_PASS   = '7f2eb44a0f8a1763ad9c3e15dd947bfc4dc04bdd'  # This is for example purposes only!
DB_NAME   = 'Freetable'

@@dbh = Mysql2::Client.new(:host => HOST_POOL, :username => DB_USER, :password => DB_PASS, :database => DB_NAME)
# 
# sp_data should be an array of hashes
# [
# 	{ value=>'', type=>'hex' },
#   { value=>'', type=>'string' }
# ]
#
# Type can be any of the following types:
#
# number   = 0-9
# hex      = 0-9a-f
# hash     = A-Za-z0-9
# string   = A-Za-z0-9 _,-,!,@,#,$,%,^,&,*,(,),+,=,[,],{,},|,<,>,.,',"

def query_database(sp_name, sp_data)
	query = 'CALL #{sp_name}(';
	sp_data.each do |ele|
		case ele['type']
			when 'number'
						output = ele['value'][/^(\d+)$/,1]
						query = query + "'#{output}', ";
			when 'hex'
            output = ele['value'][/^([0-9a-f]+)$/,1]
            query = query + "'#{output}', ";
			when 'hash'
            output = ele['value'][/^([0-9a-zA-Z]+)$/,1]
            query = query + "'#{output}', ";
			when 'string'
            output = @@dbh.escape(ele['value'])
            query = query + "'#{output}', ";
		end
	end

  2.times { query[query.length-1] = '' }

	query = query + ');'

  return @@dbh.query(query)

end

# post for things we don't want cached, get for things we do

# Post User Functions Start

# login
# nickname, password incoming 
post '/api/login' do
	query_database( 'validate_user', [{ "value"=>params['nickname'], "type"=>"string" },{ "value"=>params['password'], "type"=>"string" },{ "value"=>params['sessionid'], "type"=>"hex" }] ).to_json
end

post '/api/logout' do
  query_database( 'invalidate_user', [{ "value"=>params['nickname'], "type"=>"string" }, { "value"=>params['sessionid'], "type"=>"hex" }] ).to_json
end

post '/api/create' do
end

post '/api/forgot_password' do
end

post '/api/delete' do
end

post '/api/set_nickname' do
end

post '/api/set_email' do
end

post '/api/set_firstname' do
end

post '/api/set_lastname' do
end

post '/api/set_short_descr' do
end

post '/api/set_long_descr' do
end

post '/api/set_email_public' do
end

post '/api/set_firstname_public' do
end

post '/api/set_lastname_public' do
end

post '/api/set_short_descr_public' do
end

post '/api/set_long_descr_public' do
end

post '/api/set_avatar' do
end

post '/api/set_sprite' do
end

post '/api/set_model' do
end

post '/api/get_avatar' do
end

post '/api/get_sprite' do
end

post '/api/get_model' do
end

post '/api/add_favorite' do
end

post '/api/remove_favorite' do
end

post '/api/verify_user' do
end

post '/api/create_playlist' do
end

post '/api/delete_playlist' do
end

post '/api/rename_playlist' do
end

post '/api/get_playlist' do
end

post '/api/get_playlists' do
end

post '/api/set_current_playlist' do
end

post '/api/add_file_to_playlist' do
end

post '/api/delete_file_from_playlist' do
end

post '/api/move_file' do
end

post '/api/move_file_playlist' do
end

# Posts File Server

post '/api/create_file' do
end

post '/api/add_file_to_network' do
end

post '/api/add_server' do
end

post '/api/get_servers' do
end

# Posts Chat Server

post '/api/get_current_file' do
end

post '/api/user_played' do
end

# get start

get '/api/query_user/:uid' do
  cache_control :public
end

get '*' do
	redirect to('/')
end
