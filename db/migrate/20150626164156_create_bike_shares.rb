class CreateBikeShares < ActiveRecord::Migration
  def change
    create_table :bike_shares do |t|
      t.string     "name"
      t.float      "lat"
      t.float      "long"
      
      t.timestamps null: false
    end
  end
end
