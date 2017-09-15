# pets
new pets on petfinder

TODO:

- use react to filter list of pets by attributes and created date
- update database daily on timer

Missing from dog schema:
All shelter info (name etc - only avail is shelter ID)
Characteristics eg House trained • Spayed/Neutered • Current on vaccinations • Prefers a home without: Young Children • Primary Color(s): Yellow / Tan / Blond / Fawn • Coat Length: Short => XML below
	<options>
		<option>hasShots</option>
		<option>noKids</option>
		<option>altered</option>
		<option>housetrained</option>
	</options>

- find_new_pets should also update existing pets
- lastupdate field in API - usable? timestamp: 2017-08-29T12:01:38Z