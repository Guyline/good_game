class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string        :name
      t.decimal       :total_rating,
        :precision => 4,
        :scale => 2
      t.decimal       :possible_rating,
        :precision => 4,
        :scale => 2,
        :default => 5.0,
        :null => false
      t.timestamps
    end
  end
end
