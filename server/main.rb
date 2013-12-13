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

# MySql DB Hook when ready
# In production, the SQL DB should be on it's own pool of machines, use RRDNS for :host for failover
# Might be better to use no password and use access control lists instead here (Pondering this)

# @@dbh = Mysql2::Client.new(:host => "localhost", :username => "ft-network-services", :database => "Freetable")

# post for things we don't want cached, get for things we do

# Post User Functions Start

# login
# nickname, password incoming 
post '/api/login' do
#   return PP.pp(params, '')
end

post '/api/logout' do
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
