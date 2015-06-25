class CreateTrainStations < ActiveRecord::Migration
  def change
    create_table :train_stations do |t|
      t.string "code"
      t.string "name"
      t.float  "lat"
      t.float  "long"
      t.text   "address"
      t.timestamps null: false
    end
  end
end
