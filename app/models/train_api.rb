class TrainApi 
     
  include HTTParty
  base_uri 'http://api.wmata.com'
  Token = ENV["wmata"]

  def metro_stations
    station = TrainApi.get("/Rail.svc/json/jStations", query: { api_key: "#{Token}" })
    m = station["Stations"].map {|s| s.values_at("Name", "Lon", "Lat", "Code", "Address")}
    m.each do |s|
      TrainStation.create! name: s[0], long: s[1], lat: s[2], code: s[3], address: s[4] 

    # station = TrainApi.get("/Rail.svc/json/jStations", query: { api_key: "#{Token}" })
    # station["Stations"].each do |s|
    #   TrainStations.where({
    #     :code    =>   s["Code"], 
    #     :name    =>   s["Name"], 
    #     :lat     =>   s["Lat"],
    #     :long    =>   s["Lon"],
    #     :address =>   s["Address"].to_json
    #     }).first_or_create!
    end
  end

  def trains_incoming
    t = TrainApi.get("/StationPrediction.svc/json/GetPrediction/All", query: { api_key: "#{Token}" })
    train = t["Trains"].map { |n| n.values_at("Destination", "Line", "LocationName", "Min") }
  end
end

