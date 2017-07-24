require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/pet.rb' )

get '/pets' do
  @result = Pet.all
  erb(:"pets/index")
end

# get '/zombies/:id' do
#   @zombie = Zombie.find( params[:id ])
#   @victims = @zombie.victims
#   erb( :"zombies/show")
# end


