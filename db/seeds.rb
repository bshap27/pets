### API limits:
# Total requests per day: 10,000
# Records per request: 1,000
# Maximum records per search: 2,000

count = 100
reps = 50
counter = 0
offset = 0
p = count
sizes = ["S", "M", "L"]
round = 2

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