require_relative "../models/Owner"
require_relative "../models/Pet"
require "pry-byebug"

owner1 = Owner.new({ 'name' => 'Animal Shelter' })
owner2 = Owner.new({ 'name' => 'Alice Testerton' })
owner3 = Owner.new({ 'name' => 'Steve McTest' })

owner1.save
owner2.save
owner3.save

pet1 = Pet.new({ 'name' => 'Lugs', 'type' => 'Rabbit', 'admission_date' => 'January 1, 2016', 'adoptable' => true, 'owner_id' => owner1.id })
pet2 = Pet.new({ 'name' => 'Tiny', 'type' => 'Dog', 'admission_date' => 'January 17, 2017', 'adoptable' => false, 'owner_id' => owner1.id })

pet1.save
pet2.save