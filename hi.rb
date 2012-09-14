require 'sinatra'
require 'sinatra/content_for'
require 'Haml'
require 'json'
require 'mongo'

configure do
  set :title, "you smell"
end

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

get '/test.:type' do
  @hashy = { :id => 5, :name => "awexome" }
  return json @hashy if params[:type] == 'json'
  haml :test if params[:type] == 'html'
end

get '/somethincool' do
  @items = monkey_claw.find || []
  haml :somethincool
end

post '/somethincool' do
  monkey_claw.insert smelly: params[:smelly]
  
  redirect "/somethincool"
end

def monkey_claw
  connection = Mongo::Connection.new
  db = connection.db("shart")
  db["monkey_claw"]
end

def json (stuff)
  content_type :json
  stuff.to_json
end