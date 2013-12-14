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
require 'sequel'

HOST_POOL = 'localhost'
DB_USER   = 'ft-net-srv'
DB_PASS   = '7f2eb44a0f8a1763ad9c3e15dd947bfc4dc04bdd'  # This is for example purposes only!
DB_NAME   = 'Freetable'

@@dbh = Sequel.mysql2(DB_NAME, :user => DB_USER, :password => DB_PASS, :host => HOST_POOL)

# post for things we don't want cached, get for things we do

Dir.foreach("api-functions") {|s| require_relative("api-functions/"+s) if s !~ /^\./ }

# Catch all for what doesn't get caught first

get '*' do
	redirect to('/')
end
