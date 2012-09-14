require 'sinatra'
require 'Haml'

get '/hi' do
  "Hello World!"
end

get '/mark' do
  haml :mark
end

get '/foo/:bar' do
  @bar = params[:bar]
  haml :foo
end

get '/yourcar' do
  haml :yourcar
end

post '/yourcar' do
  @bar = params[:car]
  haml :foo
end