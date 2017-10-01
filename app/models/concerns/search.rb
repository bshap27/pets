class Search

  def self.create_breed_query(params)
    params["breed_ids"].delete("Multiple Selected")
    if params["breed_ids"].include?("Any")
      breed_query = {}
    else
      list = '(' + params['breed_ids'].join(',') + ')'
      breed_query = "pet_breeds.breed_id in #{list}"
    end
  end

  def self.create_attr_query(params)
    query = {}
    query[:size] = params["size"] if params["size"]
    query[:age] = params["age"] if params["age"]
    query[:sex] = params["sex"] if params["sex"]
    query[:zip] = DistanceApi.find_zips_in_radius(params["zip"], params["radius"])
    query
  end

  def self.create_query(params)
    # generate query
    Pet.joins(:pet_breeds)
       .where(self.create_breed_query(params))
       .where(self.create_attr_query(params))
       .where("pets.created_at >= ?", Time.now - params["created"].to_i.days)
       .where.not(:primary_photo => nil, :status => 'removed')
       .order("pets.created_at desc").uniq
  end

  def self.save_search(user, params)
    search_name = params["search_name"]
    selections = params.to_s
    UserSearch.create(:user_id => user.id, :name => search_name, :search => selections)
    # to un-string the hash, use eval(selections)
  end

end