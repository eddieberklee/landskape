require 'rubygems'
require 'sinatra'
require 'sass'

get '/' do
  haml :index
end

get '/css/*.sass' do
  content_type 'text/css', :charset => 'utf-8'
  filename = params[:splat].first
  sass ('../css/' + filename).to_sym
end
