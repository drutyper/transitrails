class StationsController < ApplicationController 
 
  def index
    t = TrainApi.new
    @info = t.metro_stations 

    b = BikeApi.new
    @bike = b.bike_stations

    s = TrainApi.new
    @train = s.trains_incoming
  end

  def show
    
  end
end