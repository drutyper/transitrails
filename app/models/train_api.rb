class TrainApi 
     
  include HTTParty
  base_uri 'http://api.wmata.com'
  Token = ENV["wmata"]

  def metro_stations
    station = TrainApi.get("/Rail.svc/json/jStations", query: { api_key: "#{Token}" })
    m = station["Stations"].map {|s| s.values_at("Name","Lat","Lon","Code","Address")}
    m.each do |s|
      TrainStation.create! code: s[0], name: s[1], lat: s[2], long: s[3], address: s[4] 

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
end

