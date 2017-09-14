class PetfinderApi

  def self.authenticate
    Petfinder::Client.new(ENV["PETFINDER_CLIENT_ID"], ENV["PETFINDER_CLIENT_SECRET"])
  end

  # options = breed, size, sex, age, offset, count
  # syntax for options: petfinder.find_pets('dog', 10014, :size => 'S')
  def self.find_new_pets(animal_type, location, *options)
    petfinder = self.authenticate
    pets = petfinder.find_pets(animal_type, location, *options)
    pets.each do |pet|
      self.create_or_update_pet(pet)
    end
  end

  def self.create_or_update_pet(pet)
    p = Pet.find_by(petfinder_num: pet.id)
    if !p
      Pet.create({petfinder_num: pet.id, name: pet.name, animal: pet.animal, mix: pet.mix, sex: pet.sex})
    end
  end

end