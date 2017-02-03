require "Date"
require "pry-byebug"
require_relative "../db/SqlRunner"
require_relative "./Owner"
require_relative "./PetType"

class Pet
  attr_reader :id, :name, :type_id, :admission_date, :adoptable, :owner_id

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type_id = options['type_id']
    @admission_date = options['admission_date']
    @adoptable = fix_boolean(options['adoptable'])
    @owner_id = options['owner_id'].to_i if options['owner_id']
  end

  def fix_boolean(val)
   return val == 't' || val == true ? true:false
  end

  def save
    sql = "INSERT INTO pets (name, type_id, admission_date, adoptable, owner_id) VALUES ('#{@name}', '#{@type_id}', '#{@admission_date}', #{@adoptable}, #{@owner_id}) returning id;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def update
    sql = "UPDATE pets SET (name, type_id, admission_date, adoptable, owner_id) = ('#{@name}', '#{@type_id}', '#{@admission_date}', #{@adoptable}, #{@owner_id}) WHERE id=#{@id};"

    result = SqlRunner.run(sql)
  end

  def date_formatted
    d = Date.parse(@admission_date)
    return d.strftime('%d %b %Y')
  end

  def self.all
    sql = "SELECT * FROM pets;"
    result = SqlRunner.run sql
    return result.map {|pet| Pet.new(pet)}
  end

  def self.available
    sql = "SELECT * FROM pets WHERE adoptable=true AND owner_id=1;"
    result = SqlRunner.run sql
    return result.map {|pet| Pet.new(pet)}
  end

  def owner
    sql = "SELECT * FROM owners WHERE id=#{@owner_id}"
    owner = SqlRunner.run(sql).first
    return Owner.new(owner)
  end

  def type
    sql = "SELECT * FROM pet_types WHERE id=#{@type_id}"
    type = SqlRunner.run(sql).first
    return PetType.new(type)
  end

  def self.find id
    sql = "SELECT * FROM pets WHERE id=#{id}"
    pet = SqlRunner.run(sql).first
    return Pet.new(pet)
  end
end