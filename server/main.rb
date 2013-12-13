###############################################################################
#
# Freetable Network Services Application Layer Server
# Created By: Stephanie Sunshine
# (C) The Freetable Project
#
###############################################################################

require 'sinatra'
require 'sinatra/reloader' if development?
require 'pp'

post '/api/login' do
   return PP.pp(params, '')
end

get '*' do
	redirect to('/')
end
