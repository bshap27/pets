require 'open-uri'

class DistanceApi
  # Google API:
  # def self.find_distance(origin, destination)
  #   url = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origin}&destinations=#{destination}&key=#{ENV['GOOGLE_DISTANCE_KEY']}&units=imperial"
  #   response = open(url) { |v| JSON(v.read).with_indifferent_access }
  #   mi = response["rows"][0]["elements"][0]["distance"]["text"]
  # end

  def self.find_zips_in_radius(origin, distance)
    url = "https://www.zipcodeapi.com/rest/#{ENV['DISTANCE_API_KEY']}/radius.json/#{origin}/#{distance}/mile?minimal"
    response = open(url) { |v| JSON(v.read).with_indifferent_access }
    zips = response["zip_codes"]
  end

end