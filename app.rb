require 'rubygems'
require 'sinatra'
require 'sass'
require 'sinatra/partial'

get '/' do
  output = ""
  output << partial( :"navbar" )
  output << partial( :"index" )
  output
end

get '/css/*.sass' do
  content_type 'text/css', :charset => 'utf-8'
  filename = params[:splat].first
  sass ('../css/' + filename).to_sym
end
