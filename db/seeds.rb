require_relative "../models/Owner"
require_relative "../models/Pet"
require "pry-byebug"

owner1 = Owner.new({ 'name' => 'Animal Shelter' })
owner2 = Owner.new({ 'name' => 'Alice Testerton' })
owner3 = Owner.new({ 'name' => 'Steve McTest' })

owner1.save
owner2.save
owner3.save

type1 = PetType.new({'type' => 'Dog'})
type2 = PetType.new({'type' => 'Cat'})
type3 = PetType.new({'type' => 'Rabbit'})
type4 = PetType.new({'type' => 'Crow'})

type1.save
type2.save
type3.save
type4.save

pet1 = Pet.new({ 'name' => 'Lugs', 'type_id' => type3.id, 'admission_date' => 'January 1, 2016', 'adoptable' => false, 'owner_id' => owner2.id })
pet2 = Pet.new({ 'name' => 'Tiny', 'type_id' => type1.id, 'admission_date' => 'January 17, 2017', 'adoptable' => false, 'owner_id' => owner1.id })
pet3 = Pet.new({ 'name' => 'Beaks', 'type_id' => type4.id, 'admission_date' => 'October 20, 2016', 'adoptable' => false, 'owner_id' => owner1.id })

pet1.save
pet2.save
pet3.save

binding.pry
nil