class BikeApi 
     
  include HTTParty

  def bike_stations
    station = BikeApi.get("http://www.capitalbikeshare.com/data/stations/bikeStations.xml")
    b = station["stations"]["station"].map {|s| s.values_at("name", "lat", "long")}
    b.each do |s|
      BikeShare.create! name: s[0], long: s[1], lat: s[2]
    end
  end
end