class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.references      :game
      t.references      :platform
      t.references      :developer
      t.references      :publisher
      t.string          :name
      t.string          :market
      t.date            :released_on
      t.timestamps
    end
  end
end
