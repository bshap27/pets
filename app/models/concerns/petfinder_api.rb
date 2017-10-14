require 'open-uri'

class PetfinderApi
  # SOURCE https://github.com/ianhirschfeld/petfinder-api/blob/master/app/services/shelter_service.rb
  # Gem and API do not observe distance/mileage radius around your location.
  API_URL = 'http://api.petfinder.com'

  def self.get_pet(petfinderid)
    url = "#{API_URL}/pet.get?key=#{ENV["PETFINDER_CLIENT_ID"]}&format=json&id=#{petfinderid}"
  end

  def self.check_pet_status(petfinderid)
    url = self.get_pet(petfinderid)
    response = open(url) { |v| JSON(v.read).with_indifferent_access }
    status_code = response["petfinder"]["header"]["status"]["code"]["$t"]
    if status_code == "201"
      p = Pet.find_by(:petfinderid => petfinderid)
      if p
        if p.status == 'removed'
          msg = "Status already removed"
          rtn = 'no update'
        else
          p.update(:status => "removed")
          msg = "Updated status to removed"
          rtn = 'removed'
        end
      end
    elsif status_code == "100"
      msg = 'Ok'
      rtn = 'ok'
    else
      puts "Bad status code #{status_code}, shutting down"
      break
    end
    puts "#{petfinderid}: Status code #{status_code}. #{msg}."
    rtn
  end

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
    # puts url # log url to be able to replicate API call
    response = open(url) { |v| JSON(v.read).with_indifferent_access }
    data = response[:petfinder][:pets]

    begin
      if data[:pet].is_a? Array
        data[:pet].each do |pet|
          attrs = get_pet_attrs(pet)
          create_or_update_pet(attrs)
          count += 1
        end
      else
        attrs = get_pet_attrs(data[:pet])
        create_or_update_pet(attrs)
        count = 1
      end
    rescue
      puts data
    end

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
      age: pet[:age]['$t'].downcase,
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
    if pet[:media] != nil && pet[:media][:photos] != nil && pet[:media][:photos][:photo] != nil
      if pet[:media][:photos][:photo].is_a? Array # refactor this to escape error
        attrs[:primary_photo] = pet[:media][:photos][:photo][0]['$t']
      else
        attrs[:primary_photo] = pet[:media][:photos][:photo]['$t']
      end
    end

    {attrs: attrs, breeds: breeds}
  end

  def self.create_or_update_pet(pet) # pet is a hash containing attrs and breeds
    p = Pet.find_by(petfinderid: pet[:attrs][:petfinderid])
    if pet.name.downcase.include?('adopted')
      pet[:attrs][:status] = 'removed'
    end
    if p == nil
      pet[:attrs][:new_pet] = true
      new_pet = Pet.create(pet[:attrs])
      pet[:breeds].each do |breed_id|
        PetBreed.create({pet_id: new_pet.id, breed_id: breed_id})
      end
    else
      pet[:attrs][:new_pet] = false
      Pet.update(p.id, pet[:attrs])
    end
  end

  def self.create_or_update_breed(breed_name)
    b = Breed.find_by(name: breed_name)
    if !b
      b = Breed.create({name: breed_name})
    end
    b.id
  end

end