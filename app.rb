require 'bundler'
Bundler.require

require_relative 'models/city'
require_relative './config'

#index
get '/' do
  redirect "/cities"
end

#show all
get '/cities' do 
  @cities = City.all 
  erb :index
end

# new
get '/cities/new' do
  erb :new
end

# create
post '/cities' do
  city = City.create(name: params["name"])
  redirect "/cities/#{ city.id }"
end

#show
get '/cities/:id' do
  @city = City.find(params[:id])
  erb :show
end

#edit
get '/cities/:id/edit' do
  @city = City.find(params[:id])
  erb :edit
end

#update
put '/cities/:id' do
  city = City.find(params[:id])
  city.name = params[:name]
  city.save
  redirect "/cities/#{ city.id }"
end

#delete
delete '/cities/:id' do
  City.delete(params[:id])
  redirect '/cities'
end


