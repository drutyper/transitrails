class StationsController < ApplicationController 
 
  def index
    t = TrainApi.new
    @info = t.metro_stations 

  end

  def show
    
  end
end