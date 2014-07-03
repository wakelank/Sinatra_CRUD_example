require 'bundler'
Bundler.require

require_relative 'models/city'
require_relative './config'

get '/' do
  redirect "/cities"
end

get '/cities' do 
  @cities = City.all 
  erb :index
end

get '/cities/new' do
  erb :new
end

post '/cities' do
  city = City.create(name: params["name"])
  redirect "/cities/#{ city.id }"
end

get '/cities/:id' do
  @city = City.find(params[:id])
  erb :show
end

get '/cities/:id/edit' do
  @city = City.find(params[:id])
  erb :edit
end

put '/cities/:id' do
  city = City.find(params[:id])
  city.name = params[:name]
  city.save
  redirect "/cities/#{ city.id }"
end

delete '/cities/:id' do
  City.delete(params[:id])
  redirect '/cities'
end


