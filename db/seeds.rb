require_relative('../models/pet.rb')
require_relative('../models/owner.rb')
require('pry-byebug')
# require_relative('../models/type.rb')
# require_relative('../models/match.rb')

Pet.delete_all
Owner.delete_all
# Pet_Type.delete_all


owner1 = Owner.new({'first_name' => 'Captain', 'last_name' => 'Hook', 'pet_type' => 'parrot',
 'owner_photo' => 
  "http://mult-online.ru/posters/260_347_90_1/uploads/posts/2011-03/thumbs/1299849073_kapitan-huk.jpg" })
owner1.save

owner2 = Owner.new({'first_name' => 'Dick', 'last_name' => 'Whittington', 'pet_type' => 'cat',
  'owner_photo' => 
  "http://www.fermanaghomagh.com/app/uploads/2015/07/dick-whittington.jpg" })
owner2.save

owner3 = Owner.new({'first_name' => 'Wallace',  'last_name' => '??', 'pet_type' => 'dog', 'owner_photo' => 
  "https://vignette4.wikia.nocookie.net/wallaceandgromit/images/3/3e/Wallace-482x298.jpg/revision/latest/scale-to-width-down/299?cb=20140526031303" })
owner3.save



pet1 = Pet.new( {
  'pet_name' => 'Boots',
  'pet_type' => 'cat',
  'breed' => 'Bombay',
  'sex' => 'female',
  'age' => '203',
  'adoptable' => 'Yes',
  'admission' => '25 Nov 2016',
  'pet_photo' => "https://www.pets4homes.co.uk/images/breeds/70/large/1c37029d04e0586b668fcf65df836cba.jpg",
  'owner_id' => owner2.owner_id
  } )
pet1.save

pet2 = Pet.new( {
  'pet_name' => 'Gromit',
  'pet_type' => 'dog',
  'breed' => 'Beagle',
  'sex' => 'male',
  'age' => '8',
  'adoptable' => 'Yes',
  'admission' => '4 Feb 2017',
  'pet_photo' => "http://apps.watershed.co.uk/shared/imagecache/appimages/1940/default/1-1/600/16/08/gromit4.jpg",
  'owner_id' => owner3.owner_id
  } )
pet2.save

pet3 = Pet.new( {
  'pet_name' => 'Pretty Polly',
  'pet_type' => 'parrot',
  'breed' => 'Eclectus',
  'sex' => 'female',
  'age' => '10',
  'adoptable' => 'Yes',
  'admission' => '13 June 2017',
  'owner_id' => owner1.owner_id,
  'pet_photo' => "https://s-media-cache-ak0.pinimg.com/736x/19/93/2c/19932cc2fca5e80076ee5399209bd32e--captain-hook-pirates.jpg"
  } )
pet3.save

pet4 = Pet.new( {
  'pet_name' => 'Nemo',
  'pet_type' => 'fish',
  'breed' => 'Clown',
  'sex' => 'male',
  'age' => '1',
  'adoptable' => 'No',
  'admission' => '4 July 2017',
  'owner_id' => owner1.owner_id,
  'pet_photo' => "https://vignette4.wikia.nocookie.net/pixar/images/8/8d/Nemo_Promo_1.png/revision/latest?cb=20160710221424"
  } )
pet4.save






# student1.age = 12
# student1.update
# p student1
# student1.delete
# p Student.find(23)
# p House.all

# puts student1.house
# p house1.students