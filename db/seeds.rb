### API limits:
# Total requests per day: 10,000
# Records per request: 1,000
# Maximum records per search: 2,000

count = 100
reps = 1
counter = 0
offset = 0
p = count
sizes = ["S", "M", "L"]
round = 0

while p == count && counter < reps && round < sizes.length
  p = PetfinderApi.find_new_pets('dog', 10014, :offset => offset, :count => count, :size => sizes[round])
  offset += count
  counter += 1
  if (p < count || offset >= 2000) && round < sizes.length
    round += 1
    offset = 0
    counter = 0
  end
  puts "Size #{sizes[round]} Round #{counter}: #{count} results."
end

# def update_breed(breed_name)
#   b = Breed.find_by(name: breed_name)
#   if b
#     b.update({hub_exclude: true})
#   else
#     Breed.create({name: breed_name, hub_exclude: true})
#   end
# end

# sophie_breeds = ["Afghan Hound", "Akita", "Alabai", "Alaskan Malamute", "American Bandogge", "Australian Cattle Dog / Blue Heeler", "Basenji", "Basset Hound", "Bedlington Terrier", "Bernese Mountain Dog", "Bloodhound", "Boerboel", "Boxer", "Bullmastiff", "Mastiff", "Bully Kutta", "American Bulldog", "English Bulldog", "Cane Corso Italiano", "Caucasian Ovcharka", "Chow Chow", "Dalmatian", "Doberman Pinscher", "Dogo Argentino", "Fila Brasilerio", "German Shepherd Dog", "German Shepherd", "Shepherd", "Great Dane", "Gull Dong", "Kangal", "Keeshond Mastiff", "Keeshond" "Pointer", "Pit Bull Terrier", "Pit Bull", "American Staffordshire Terrier", "Irish Staffordshire Terrier", "Staffordshire Bull Terrier", "Bull Terrier", "Presa Canario", "Rhodesian Ridgeback", "Rottweiler", "Saluki", "Saint Bernard", "Saint Bernard / St. Bernard", "Siberian Husky", "Tibetan Mastiffe", "Tosa Inu", "Weimaraner"]

# sophie_breeds.each do |b|
#   update_breed(b)
# end