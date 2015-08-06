class RemoveDeveloperIdAndPublisherIdFromReleases < ActiveRecord::Migration
  def change
    remove_column :releases, :developer_id, :integer
    remove_column :releases, :publisher_id, :integer
  end
end
