require_relative "../db/SqlRunner"
require_relative "./Pet"

class Owner
  attr_reader :id, :name

  def initialize options 
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO owners (name) VALUES ('#{@name}') returning id;"
    result = SqlRunner.run sql
    @id = result[0]['id'].to_i
  end

  def pets
    sql = "SELECT * FROM pets WHERE owner_id=#{@id}"
    pets = SqlRunner.run(sql)
    return pets.map {|pet| Pet.new(pet) }
  end

  def self.all
    sql = "SELECT * FROM owners;"
    owners = SqlRunner.run sql
    return owners.map {|owner| Owner.new(owner) }
  end
end