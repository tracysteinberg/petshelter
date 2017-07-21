require('sinatra')
require('sinatra/contrib/all') if development?
also_reload( './models/*.rb') if development?
require_relative('./models/owner.rb')
require_relative('./models/pet.rb')
require_relative('./models/type.rb')


get '/pets' do
  @result = Pet.all
  erb(:index)
end

get '/pets/new' do
  @owners = Owner.all
erb(:new)
end

post '/pets' do
 pet1 = Pet.new(params)
 pet1.save
 redirect '/pets'
end