# rake app/models/concerns/hub_exclude.rb

def update_breed(breed_name)
  b = Breed.find_by(name: breed_name)
  if b
    b.update({hub_exclude: true})
  else
    Breed.create({name: breed_name, hub_exclude: true})
  end
end

sophie_breeds = ["Afghan Hound", "Akita", "Alabai", "Alaskan Malamute", "American Bandogge", "Australian Cattle Dog / Blue Heeler", "Basenji", "Basset Hound", "Bedlington Terrier", "Bernese Mountain Dog", "Bloodhound", "Boerboel", "Boxer", "Bullmastiff", "Mastiff", "Bully Kutta", "American Bulldog", "English Bulldog", "Cane Corso Italiano", "Caucasian Ovcharka", "Chow Chow", "Dalmatian", "Doberman Pinscher", "Dogo Argentino", "Fila Brasilerio", "German Shepherd Dog", "German Shepherd", "Shepherd", "Great Dane", "Gull Dong", "Kangal", "Keeshond Mastiff", "Keeshond" "Pointer", "Pit Bull Terrier", "Pit Bull", "American Staffordshire Terrier", "Irish Staffordshire Terrier", "Staffordshire Bull Terrier", "Bull Terrier", "Presa Canario", "Rhodesian Ridgeback", "Rottweiler", "Saluki", "Saint Bernard", "Saint Bernard / St. Bernard", "Siberian Husky", "Tibetan Mastiffe", "Tosa Inu", "Weimaraner"]

sophie_breeds.each do |b|
  update_breed(b)
end