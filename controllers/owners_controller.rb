require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )

get '/owners' do
  @result = Owner.all
  erb(:"owners/index")
end

# get '/zombies/:id' do
#   @zombie = Zombie.find( params[:id ])
#   @victims = @zombie.victims
#   erb( :"zombies/show")
# end


