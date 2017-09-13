class PetfinderApi
  def initialize
  end

  def self.authenticate
    # RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])
    # petfinder = Petfinder::Client.new(ENV["PETFINDER_CLIENT_ID"], ENV["PETFINDER_CLIENT_SECRET"])
    Petfinder::Client.new(ENV["PETFINDER_CLIENT_ID"], ENV["PETFINDER_CLIENT_SECRET"])
  end

  # def find_new_pets
    # PetfinderApi.authenticate
  #   if x
  #   else
  #   end
  # end
end