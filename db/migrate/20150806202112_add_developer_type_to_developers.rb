class AddDeveloperTypeToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :developer_type, :string, :after => :established_on
  end
end
