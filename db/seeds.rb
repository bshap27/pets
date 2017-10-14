### API limits:
# Total requests per day: 10,000
# Records per request: 1,000
# Maximum records per search: 2,000

def ingest_pets
  count = 100
  reps = 50
  counter = 0
  offset = 0
  p = count
  sizes = ["S", "M", "L"]
  round = 0

  while p == count && counter < reps && round < sizes.length
    p = PetfinderApi.load_pets('dog', 10014, :offset => offset, :count => count, :size => sizes[round])
    offset += count
    counter += 1
    if (p < count || offset >= 2000) && round < sizes.length
      round += 1
      offset = 0
      counter = 0
    end
    puts "Size #{sizes[round]} Round #{counter}: #{count} results."
  end
end

def check_status
  num_all_pets = Pet.all.count
  half_count = num_all_pets/2
  removed_counter = 0
  total_checked_counter = 0

  if Date.today.strftime('%d').to_i % 2 == 0
    pets_to_check = Pet.select(:petfinderid).limit(half_count)
  else
    pets_to_check = Pet.select(:petfinderid)
  end

  ids_to_check = pets_to_check.collect {|pet| pet.petfinderid}.reverse[0..half_count]
  ids_to_check.each do |id|
    chk = PetfinderApi.check_pet(id)
    if chk == 'removed'
      removed_counter += 1
    end
    total_checked_counter += 1
  end
  puts "DONE! Total marked as removed: #{removed_counter}. Total checked: #{total_checked_counter}."
end

check_status
ingest_pets