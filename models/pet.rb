require_relative('../db/sql_runner.rb')

  
class Pet

  attr_reader(:pet_id, :pet_name, :pet_type, :breed, :sex, :age, :size, :adoptable, :pet_photo, :type_id)
  attr_accessor()

  def initialize(details)
    @pet_id = details['pet_id'].to_i
    @pet_name = details['name']
    @pet_type = details['pet_type']
    @breed = details['breed']
    @sex = details['sex']
    @age = details['age']
    @size = details['size']
    @adoptable = details['adoptable']
    @pet_photo = details['pet_photo']
    @type_id = details['type_id'].to_i
  end

  def save()
      sql = "INSERT INTO pets
      (pet_name, pet_type, breed, sex, age, size, adoptable, pet_photo, type_id) 
      VALUES 
      ($1, $2, $3, $4, $5, $6, $7, $8, $9)
      RETURNING id;"
      values = [@pet_name, @pet_type, @breed, @sex, @age, @size, @adoptable, @pet_photo, @type_id]
      pet = SqlRunner.run(sql, values)
      @pet_id = pet[0]['pet_id'].to_i
    end

    def update()
      sql = "UPDATE pets 
      SET
      pet_name = $1,
      pet_type = $2,
      breed = $3,
      sex = $4,
      age = $5,
      size = $6,
      adoptable = $7,
      pet_photo = $8,
      type_id = $9
      WHERE pet_id = $10;"
      values = [@pet_name, @pet_type, @breed, @sex, @age, @size, @adoptable, @pet_photo, @type_id, @pet_id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM pets WHERE pet_id = $1;"
      values = [@id]
      SqlRunner.run( sql, values)
    end

    def owner
      sql = "SELECT owners.* FROM owners
             INNER JOIN pets
             ON type_id = type.id
             WHERE $1 = type.id;"
      values = [@id]
      result = Owner.map_items(sql, values)[0]
      return result
    end

    def self.all()
      sql = "SELECT * FROM pets;"
      values = nil
      result = self.map_items(sql, values)
      return result
    end

    def self.find(id)
      sql = "SELECT * FROM pets WHERE id = $1;"
      values = [id]
      result = self.map_items(sql, values).first
      return result
    end

    def self.map_items(sql, values)
      pets = SqlRunner.run( sql, values )
      result = pets.map { |pet| Pet.new( pet ) }
      return result
    end

    def self.delete_all
      sql = "DELETE FROM pets;"
      values = nil
      SqlRunner.run(sql, values)
    end

end