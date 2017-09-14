Pet.create([
  {petfinder_num: '31604370', name: 'Leggs', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '37848260', name: 'Wednesday', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '38067335', name: 'Sandy', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '33701931', name: 'Gucci', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '35019990', name: 'Roxy', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '38781233', name: 'Alex', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '38781283', name: 'Alex', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '37405452', name: 'Holiday', animal: 'Dog', mix: 'no', sex: 'F'},
  {petfinder_num: '36449269', name: 'Hope', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '36974356', name: 'Calvin', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '38788046', name: 'Lucky', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '38799307', name: 'Cupid', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '38588753', name: 'Harley', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '39245659', name: 'Anna Sui', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '39248483', name: 'Star', animal: 'Dog', mix: 'yes', sex: 'F'},
  {petfinder_num: '39313093', name: 'Ronin', animal: 'Dog', mix: 'no', sex: 'M'},
  {petfinder_num: '39360015', name: 'Riley', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '39359984', name: 'Rex', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '39359139', name: 'Oliver', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '38244882', name: 'Rocky', animal: 'Dog', mix: 'no', sex: 'M'},
  {petfinder_num: '37253070', name: 'Hero', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '39368239', name: 'William', animal: 'Dog', mix: 'yes', sex: 'M'},
  {petfinder_num: '36496131', name: 'WEBSTER', animal: 'Dog', mix: 'no', sex: 'M'}
])

Breed.create([
  {name: 'Havanese'},
  {name: 'Pug'},
  {name: 'Cocker Spaniel'},
  {name: 'Spaniel'}
])

# options = breed, size, sex, age, offset, count
# syntax for options: petfinder.find_pets('dog', 10014, :size => 'S')
def find_new_pets(animal_type, location, *options)
  petfinder = PetfinderApi.authenticate
  pets = petfinder.find_pets(animal_type, location, *options)
  pets.each do |pet|
    Pet.create_or_update_pet(pet.id)
  end
end