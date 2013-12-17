###############################################################################
#
# Freetable Network Services Application Layer Server
# Created By: Stephanie Sunshine
# (C) The Freetable Project
#
###############################################################################

# Required modules
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/respond_to'
require 'json'
require 'pp'
require 'mysql2'
require 'logger'
require 'connection_pool'

# Conf import
require_relative('conf')

# Setup a database connection pool
@@dbh_pool = ConnectionPool.new( :size => 4 ) { Mysql2::Client.new(	:host      => HOST_POOL, 
									:database  => DB_NAME, 
									:username  => DB_USER, 
									:password  => DB_PASS, 
									:flags     => Mysql2::Client::MULTI_STATEMENTS, 
									:reconnect => true, 
									:encoding  => 'utf8' ) }

# Dynamic loader, anything in api-functions will be dynamically loaded inline at runtime 
Dir.foreach("api-functions") {|s| require_relative("api-functions/"+s) if s !~ /^\./ }

# Catch all for what doesn't get caught first
get '*' do
	redirect to('/')
end
