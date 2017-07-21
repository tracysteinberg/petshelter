require_relative('../db/sql_runner.rb')

  
class TYPE

  attr_reader(:type_id, :pet_type, :pet_photo)

  def initialize(details)
    @type_id = details['type_id'].to_i
    @pet_type = details['pet_type']
    @pet_photo = details['pet_photo']
  end

  def save()
      sql = "INSERT INTO types
      (pet_type, pet_photo) 
      VALUES 
      ($1, $2, $3, $4) 
      RETURNING id;"
      values = [@first_name, @last_name, @animal_type, @animal_photo]
      owner = SqlRunner.run(sql, values)
      @id = owner[0]['owner_id'].to_i
    end

    def pets
      sql = "SELECT * FROM pets
             WHERE house_id = $1;"
      values = [@id]
      result = Pets.map_items(sql, values)
      return result
    end

    def self.all()
      sql = "SELECT * FROM owners;"
      values = nil
      result = self.map_items(sql, values)
      return result
    end

    def self.find(id)
      sql = "SELECT * FROM owners WHERE id = $1;"
      values = [@id]
      result = self.map_items(sql, values).first
      return result
    end

    def self.map_items(sql, values)
      owners = SqlRunner.run( sql, values )
      result = owners.map { |owner| Owners.new( house ) }
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM owners;"
      values = nil
      SqlRunner.run(sql, values)
    end



end