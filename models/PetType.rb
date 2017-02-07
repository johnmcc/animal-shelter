require_relative "../db/SqlRunner"
class PetType
  attr_reader :id, :type
  def initialize options
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save
    sql = "INSERT INTO pet_types (type) VALUES ('#{@type}') returning id"
    result = SqlRunner.run sql
    @id = result.first['id']
  end

  def self.all
    sql = "SELECT * FROM pet_types;"
    result = SqlRunner.run sql
    return result.map {|type| PetType.new(type)}
  end
end