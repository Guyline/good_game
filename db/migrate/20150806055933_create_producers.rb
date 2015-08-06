class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string        :name
      t.string        :city
      t.string        :state
      t.string        :country
      t.datetime      :established_on
      t.timestamps
    end
  end
end
