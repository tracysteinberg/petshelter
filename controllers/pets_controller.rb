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
  Pet.destroy(params[:pet_id])
  redirect to("/pets")
end
# get '/pets/new' do
#   @pets = Pet.all
# erb(:new)
# end

# post '/pets' do
#  pet1x = Pet.new(params)
#  pet1x.save
#  redirect '/pets'
# end


# get '/zombies/:id' do
#   @zombie = Zombie.find( params[:id ])
#   @victims = @zombie.victims
#   erb( :"zombies/show")
# end


