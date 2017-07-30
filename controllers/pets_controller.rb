require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/pet.rb' )
require_relative( '../models/owner.rb' )


get '/pets' do
  @result = Pet.all
  erb(:"pets/index")
end

get '/pets/new' do
  @result2 = Pet.all
  @owners = Owner.all
erb(:"pets/new")
end

post '/pets' do
 pet1x = Pet.new(params)
 pet1x.save
 redirect '/pets'
end


post '/pets/:pet_id/delete' do
  pet = Pet.find(params['pet_id'])
  pet.delete
  redirect to("/pets")
end


get '/pets/:pet_id/edit' do
  @pet = Pet.find(params['pet_id'])
  erb(:"pets/edit")
end

post '/pets/:pet_id' do
  pet = Pet.new(params)
  pet.update
  redirect to("pets")
end
 







