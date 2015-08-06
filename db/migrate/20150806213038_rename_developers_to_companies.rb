class RenameDevelopersToCompanies < ActiveRecord::Migration
  def change
    rename_table :developers, :companies
  end
end
