require 'open-uri'

class PetfinderApi
  #################
  # Petfinder Gem #
  #################

  # The below methods are functional for the petfinder gem. The gem is insufficient because it doesn't allow you to set a mileage radius around your location.

  # def self.authenticate
  #   Petfinder::Client.new(ENV["PETFINDER_CLIENT_ID"], ENV["PETFINDER_CLIENT_SECRET"])
  # end

  # options = breed, size, sex, age, offset, count
  # syntax for options: petfinder.find_pets('dog', 10014, :size => 'S')
  # def self.find_new_pets(animal_type, location, *options)
  #   petfinder = self.authenticate
  #   pets = petfinder.find_pets(animal_type, location, *options)
  #   pets.each do |pet|
  #     self.create_or_update_pet(pet)
  #   end
  # end

  #################
  # Petfinder API #
  #################
  # SOURCE https://github.com/ianhirschfeld/petfinder-api/blob/master/app/services/shelter_service.rb
  API_URL = 'http://api.petfinder.com'

  def self.find_new_pets(animal_type, location, *options)
    url = "#{API_URL}/pet.find?key=#{ENV["PETFINDER_CLIENT_ID"]}&format=json&animal=#{animal_type}&location=#{location}"
    count = 0
    # age=young&age=adult&gender=female&distance=25&characteristics=houseTrained&size=S&size=M
    # options looks like this: [{:count=>25, :size=>"S"}]
    if options.length > 0
      options[0].each do |key, value|
        url = url + '&' + key.to_s + '=' + value.to_s
      end
    end
    if !url['distance'] # default distance 25 miles
      url = url + '&distance=25'
    end

    response = open(url) { |v| JSON(v.read).with_indifferent_access }
    data = response[:petfinder][:pets]
    # animals = [] # this is only necessary if you want the method to return all of the animals found. (1/4)

    if data[:pet].is_a? Array
      data[:pet].each do |pet|
        # Only import dogs and cats => At launch my app will only offer dog search. Commenting out for now.
        # next unless ['Dog', 'Cat'].include?(pet[:animal]['$t'])

        attrs = get_pet_attrs(pet)
        animal = create_or_update_pet(attrs) # creates/updates pet one at a time
        # animals.push animal (2/4)
        count += 1
      end
    else
      attrs = get_pet_attrs(data[:pet])
      animal = create_or_update_pet(attrs)
      count = 1
      # animals.push animal (3/4)
    end

    # pets.each do |pet| # creates/updates pets after all are gathered in array
    #   self.create_or_update_pet(pet)
    # end
    # animals (4/4)
    count
  end

  def self.get_pet_attrs(pet = {})
    # pet URL is https://www.petfinder.com/petdetail/<id>
    attrs = {
      petfinderid: pet[:id]['$t'],
      name: pet[:name]['$t'],
      city: pet[:contact][:city]['$t'],
      state: pet[:contact][:state]['$t'],
      zip: pet[:contact][:zip]['$t'],
      # phone: pet[:contact][:phone]['$t'],
      # fax: pet[:contact][:fax]['$t'],
      description: pet[:description]['$t'],
      sex: pet[:sex]['$t'],
      size: pet[:size]['$t'],
      mix: pet[:mix]['$t'],
      animal: pet[:animal]['$t']
      # photos below
    }

    breeds = []
    if pet[:breeds][:breed].is_a? Array
      pet[:breeds][:breed].each do |breed|
        b = self.create_or_update_breed(breed["$t"])
        breeds.push b
      end
    else
      b = self.create_or_update_breed(pet[:breeds][:breed]['$t']) # find breed id
      breeds.push b
    end

    # this will store multiple photos. storing one primary for now.
    # if pet[:media][:photos][:photo].is_a? Array
    #   pet[:media][:photos][:photo].each do |photo|
    #     attrs[:photos].push photo['$t']
    #   end
    # else
    #   attrs[:photos].push pet[:media][:photos][:photo]['$t']
    # end
    if pet[:media][:photos][:photo].is_a? Array
      attrs[:primary_photo] = pet[:media][:photos][:photo][0]['$t']
    else
      attrs[:primary_photo] = pet[:media][:photos][:photo]['$t']
    end

    {attrs: attrs, breeds: breeds}
  end
  ####

  def self.create_or_update_pet(pet) # pet is a hash containing attrs and breeds
    p = Pet.find_by(petfinderid: pet[:attrs][:petfinderid])
    if p == nil
      # create pet without breed info
      # create pet_breed(s) with breed id(s)
      new_pet = Pet.create(pet[:attrs])
      pet[:breeds].each do |breed_id|
        PetBreed.create({pet_id: new_pet.id, breed_id: breed_id})
      end
  # else
    # update pet
    end
  end

  def self.create_or_update_breed(breed_name)
    b = Breed.find_by(name: breed_name)
    if !b
      b = Breed.create({name: breed_name})
    end
    b.id
  end

  # def self.create_or_update_pet(pet) # Below are the pet attributes available when using the petfinder gem.
  #   p = Pet.find_by(petfinderid: pet.id)
  #   if !p
  #     Pet.create({petfinderid: pet.id, name: pet.name, animal: pet.animal, mix: pet.mix, sex: pet.sex}) #refactor this to iterate over pet attributes?
  #   end
  # end

end