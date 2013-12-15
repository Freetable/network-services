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
require 'pp'
require 'mysql2'
require 'logger'
require 'connection_pool'
require 'sequel'

HOST_POOL = 'localhost'
DB_USER   = 'ft-net-srv'
DB_PASS   = '7f2eb44a0f8a1763ad9c3e15dd947bfc4dc04bdd'  # This is for example purposes only!
DB_NAME   = 'Freetable'

@@dbh_pool = ConnectionPool.new( :size => 4 ) { Mysql2::Client.new(:host => HOST_POOL, :database => DB_NAME, :username => DB_USER, :password => DB_PASS, :flags => Mysql2::Client::MULTI_STATEMENTS, :reconnect => true, :encoding => 'utf8' ) }

Dir.foreach("api-functions") {|s| require_relative("api-functions/"+s) if s !~ /^\./ }

# Catch all for what doesn't get caught first

get '*' do
	redirect to('/')
end
