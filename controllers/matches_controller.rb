require( 'sinatra' )
require( 'sinatra/contrib/all' ) 
# require_relative( '../models/owner.rb' )

get '/matches' do
  @owners = Owner.all
  # @pets = Pet.all
  erb(:"matches/index")
end

# get '/zombies/:id' do
#   @zombie = Zombie.find( params[:id ])
#   @victims = @zombie.victims
#   erb( :"zombies/show")
# end


