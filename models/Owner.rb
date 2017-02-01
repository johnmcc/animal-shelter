require_relative "../db/SqlRunner"

class Owner
  attr_reader :id

  def initialize options 
    @id = nil or options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO owners (name) VALUES ('#{@name}') returning id;"
    result = SqlRunner.run sql
    @id = result[0]['id'].to_i
  end
end