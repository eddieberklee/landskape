require 'rubygems'
require 'sinatra'
require 'sass'
require 'sinatra/partial'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  output = ""
  output << partial( :"navbar" )
  output << partial( :"filters" )
  output << partial( :"index" )
  output
end

get '/css/*.sass' do
  content_type 'text/css', :charset => 'utf-8'
  filename = params[:splat].first
  sass ('../css/' + filename).to_sym
end
