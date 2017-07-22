require_relative('../db/sql_runner.rb')

  
class Owner

  attr_reader(:owner_id, :first_name, :last_name, :pet_type, :owner_photo)
  attr_accessor()

  def initialize(details)
    @owner_id = details['owner_id'].to_i
    @first_name = details['first_name']
    @last_name = details['last_name']
    @pet_type = details['pet_type']
    @owner_photo = details['owner_photo']
  end

  def save()
      sql = "INSERT INTO owners
      (first_name, last_name, pet_type, owner_photo) 
      VALUES 
      ($1, $2, $3, $4) 
      RETURNING owner_id;"
      values = [@first_name, @last_name, @pet_type, @owner_photo]
      owner = SqlRunner.run(sql, values)
      @owner_id = owner[0]['owner_id'].to_i
    end

    def pets
      sql = "SELECT * FROM pets
             WHERE owner_id = $1;"
      values = [@owner_id]
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
      result = owners.map { |owner| Owners.new( owner ) }
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM owners;"
      values = nil
      SqlRunner.run(sql, values)
    end



end