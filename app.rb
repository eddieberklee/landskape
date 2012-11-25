require 'rubygems'
require 'sinatra'
require 'sass'
require 'sinatra/partial'
require './public/db'

# Set the static files
set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  set :views, File.dirname(__FILE__) + '/views'
  output = ""
  output << partial( :"index-top", :locals => {:title => 'Index'} )
  output << partial( :"navbar", :locals => {:username => 'amadeus'} )
  output << partial( :"filters" )
  output << partial( :"index" )
  output << partial( :"pics" )
  output << partial( :"index-bottom" )
  output
end

get '/upload' do
  set :views, File.dirname(__FILE__) + '/views'
  output = ""
  output << partial( :"index-top", :locals => {:title => 'Upload'} )
  output << partial( :"navbar", :locals => {:username => 'amadeus'} )
  output << partial( :"filters" )

  output << partial( :"upload" )

  output << partial( :"index-bottom" )
  output
end

get '/name/:id' do
  params[:id]
end

get '/user' do
  set :views, File.dirname(__FILE__) + '/views'
	user = 'amadeus'
  output = ""
  output << partial( :"index-top", :locals => {:title => 'User '+user} )
  output << partial( :"navbar", :locals => {:username => user} )
  output << partial( :"filters")
  output << partial( :"userpage", :locals => {:user => user, :desc => 'I am a music god and prodigy. All at the same time'})
  output << partial( :"pics")
  output << partial( :"index-bottom")
  output
end
get '/userchopin' do
  set :views, File.dirname(__FILE__) + '/views'
	user = 'chopin'
  output = ""
  output << partial( :"index-top", :locals => {:title => 'User '+user} )
  output << partial( :"navbar", :locals => {:username => user} )
  output << partial( :"filters")
  output << partial( :"userpage", :locals => {:user => user, :desc => 'I am a music god and prodigy. All at the same time'})
  output << partial( :"pics")
  output << partial( :"index-bottom")
  output
end
get '/userliszt' do
  set :views, File.dirname(__FILE__) + '/views'
	user = 'liszt'
  output = ""
  output << partial( :"index-top", :locals => {:title => 'User '+user} )
  output << partial( :"navbar", :locals => {:username => user} )
  output << partial( :"filters")
  output << partial( :"userpage", :locals => {:user => user, :desc => 'I am a music god and prodigy. All at the same time'})
  output << partial( :"pics")
  output << partial( :"index-bottom")
  output
end

get '/stylesheets/*.sass' do
  set :views, File.dirname(__FILE__) + '/public/css'
  filename = params[:splat].first
  sass filename.to_sym
end

