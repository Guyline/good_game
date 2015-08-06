class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.references        :producer
      t.string            :name
      t.date              :released_on
      t.timestamps
    end
  end
end
