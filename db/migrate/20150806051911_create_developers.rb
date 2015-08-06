class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.references  :predecessor
      t.references  :principal_developer
      t.string      :name
      t.string      :city
      t.string      :state
      t.string      :country
      t.date        :established_on
      t.timestamps
    end
  end
end
