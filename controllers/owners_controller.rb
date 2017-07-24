require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
require_relative( '../models/pet.rb' )

get '/owners' do
  @result = Owner.all
  erb(:"owners/index")
end

get '/owners/new' do
  @result2 = Owner.all
  @pets = Pet.all
erb(:"owners/new")
end

post '/owners' do
 owner1x = Owner.new(params)
 owner1x.save
 redirect '/owners'
end

post '/owners/:owner_id/delete' do
  Owner.destroy(params[:owner_id])
  redirect to("/owners")
end

# get '/zombies/:id' do
#   @zombie = Zombie.find( params[:id ])
#   @victims = @zombie.victims
#   erb( :"zombies/show")
# end


