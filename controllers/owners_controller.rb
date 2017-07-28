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
  owner = Owner.find(params['owner_id'])
  owner.delete
  redirect to("/owners")
end


# post '/owners/:owner_id' do
#   Owner.update(params[:owner_id])
#   redirect to("owners")
# end


get '/owners/:owner_id/edit' do
  @owner = Owner.find(params['owner_id'])
  erb(:"owners/edit")
end

post '/owners/:owner_id' do
  owner = Owner.new(params)
  owner.update
  redirect to("owners")
end






