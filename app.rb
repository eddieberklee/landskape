require 'rubygems'
require 'sinatra'
require 'sass'
require 'sinatra/partial'

# Set the static files 
set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  output = ""
  output << partial( :"index-top" )
  output << partial( :"navbar" )
  output << partial( :"filters" )
  output << partial( :"index" )
  output << partial( :"index-bottom" )
  output
end

get '/upload' do
  output = ""
  output << partial( :"index-top" )
  output << partial( :"navbar" )
  output << partial( :"filters" )

  output << partial( :"upload" )

  output << partial( :"index-bottom" )
  output
end

get '/css/*.hi' do
  set :views, File.dirname(__FILE__) + '/public/css'
  sass "style".to_sym
end

get '/stylesheets/*.sass' do
  set :views, File.dirname(__FILE__) + '/public/css'
  filename = params[:splat].first
  sass filename.to_sym
end
