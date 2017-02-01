require_relative "../db/SqlRunner"

class Pet

  def initialize options
    @id = options['id'] or nil
    @name = options['name']
    @type = options['type']
    @admission_date = options['admission_date']
    @adoptable = options['adoptable']
    @owner_id = options['owner_id'] or nil
  end

  def save
    sql = "INSERT INTO pets (name, type, admission_date, adoptable, owner_id) VALUES ('#{@name}', '#{@type}', '#{@admission_date}', '#{@adoptable}', #{@owner_id}) returning id;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end
end