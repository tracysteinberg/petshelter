require('sinatra')
require('sinatra/contrib/all') if development?
also_reload( './models/*.rb') if development?
require_relative('./models/owner.rb')
require_relative('./models/pet.rb')
require_relative('./controllers/pets_controller')
require_relative('./controllers/owners_controller')
require_relative('./controllers/matches_controller')

get '/' do
  erb( :index )
end



# get '/' do
#  @result = Pet.all
#  erb(:index)
# end

# get '/' do
#  @result = Owner.all
#  erb(:index)
# end



# get '/petshelter' do
#  @result = Owner.all
#  erb(:index)
# end




# get '/owners/new' do
#   @owners = Owner.all
# erb(:new)
# end

# post '/petshelter' do
#  pet1 = Pet.new(params)
#  pet1.save
#  redirect '/petshelter'
# end