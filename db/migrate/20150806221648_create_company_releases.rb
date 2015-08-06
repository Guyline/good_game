class CreateCompanyReleases < ActiveRecord::Migration
  def change
    create_table :company_releases do |t|
      t.references    :company
      t.references    :release
      t.string        :company_release_type
      t.timestamps
    end
  end
end
