require_relative('../db/sql_runner.rb')
# require('pry-byebug')
  
class Pet

  attr_reader(:pet_id, :pet_name, :pet_type, :breed, :sex, :age, :adoptable, :admission, :pet_photo, :owner_id) 
  attr_accessor()

  def initialize(details)
    @pet_id = details['pet_id'].to_i
    @pet_name = details['pet_name']
    @pet_type = details['pet_type']
    @breed = details['breed']
    @sex = details['sex']
    @age = details['age']
    @adoptable = details['adoptable']
    @admission = details['admission']
    @pet_photo = details['pet_photo']
    @owner_id = details['owner_id'].to_i
    # @type_id = details['type_id'].to_i
  end

  def save()
      sql = "INSERT INTO pets

      (pet_name, pet_type, breed, sex, age, adoptable, admission, pet_photo, owner_id) 
      VALUES 
      ($1, $2, $3, $4, $5, $6, $7, $8, $9)
      RETURNING pet_id;"
    
        values = [@pet_name, @pet_type, @breed, @sex, @age, @adoptable, @admission, @pet_photo, @owner_id]
        
        results = SqlRunner.run(sql, values)
        @pet_id = results.first()['pet_id'].to_i
    
    end

    def update()
      sql = "UPDATE pets 
      SET
      pet_name = $1,
      pet_type = $2,
      breed = $3,
      sex = $4,
      age = $5,
      adoptable = $6,
      admission = $7,
      pet_photo = $8,
      WHERE pet_id = $9;"
      values = [@pet_name, @pet_type, @breed, @sex, @age, @adoptable, @admission, @pet_photo,
        @pet_id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM pets WHERE pet_id = $1;"
      values = [@pet_id]
      SqlRunner.run( sql, values)
    end

    def owner
      sql = "SELECT owners.* FROM owners
             INNER JOIN pets
             ON pet_id = pet.id
             WHERE $1 = pet.id;"
      values = [@owner_id]
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
      sql = "SELECT * FROM pets WHERE pet_id = $1;"
      values = [pet_id]
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