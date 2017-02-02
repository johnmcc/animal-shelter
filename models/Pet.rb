require "Date"
require "pry-byebug"
require_relative "../db/SqlRunner"
require_relative "./Owner"

class Pet
  attr_reader :id, :name, :type, :admission_date, :adoptable

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @admission_date = options['admission_date']
    @adoptable = fix_boolean(options['adoptable'])
    @owner_id = options['owner_id'].to_i if options['owner_id']
  end

  def fix_boolean(val)
   return val == 't' || val == true ? true:false
  end

  def save
    sql = "INSERT INTO pets (name, type, admission_date, adoptable, owner_id) VALUES ('#{@name}', '#{@type}', '#{@admission_date}', #{@adoptable}, #{@owner_id}) returning id;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def update
    sql = "UPDATE pets SET (name, type, admission_date, adoptable, owner_id) = ('#{@name}', '#{@type}', '#{@admission_date}', #{@adoptable}, #{@owner_id}) WHERE id=#{@id};"
    result = SqlRunner.run(sql)
  end

  def toggle_adoptability
    @adoptable = !@adoptable
    update
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

  def owner
    sql = "SELECT * FROM owners WHERE id=#{@owner_id}"
    owner = SqlRunner.run(sql).first
    return Owner.new(owner)
  end

  def self.find id
    sql = "SELECT * FROM pets WHERE id=#{id}"
    pet = SqlRunner.run(sql).first
    return Pet.new(pet)
  end
end