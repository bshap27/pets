require 'open-uri'

class PetfinderGem
  # The below methods are functional for the petfinder gem.

  def self.authenticate
    Petfinder::Client.new(ENV["PETFINDER_CLIENT_ID"], ENV["PETFINDER_CLIENT_SECRET"])
  end

  # options = breed, size, sex, age, offset, count
  # syntax for options: petfinder.find_pets('dog', 10014, :size => 'S')
  def self.load_pets(animal_type, location, *options)
    petfinder = self.authenticate
    pets = petfinder.find_pets(animal_type, location, *options)
    pets.each do |pet|
      self.create_or_update_pet(pet)
    end
  end

  def self.create_or_update_pet(pet) # Below are the pet attributes available when using the petfinder gem.
    p = Pet.find_by(petfinderid: pet.id)
    if !p
      Pet.create({petfinderid: pet.id, name: pet.name, animal: pet.animal, mix: pet.mix, sex: pet.sex}) #refactor this to iterate over pet attributes?
    end
  end
end