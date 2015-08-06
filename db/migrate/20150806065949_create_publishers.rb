class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string      :name
      t.string      :city
      t.string      :state
      t.string      :country
      t.date        :established_on
      t.timestamps
    end
  end
end
