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


