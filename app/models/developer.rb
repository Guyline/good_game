# == Schema Information
#
# Table name: developers
#
#  id                     :integer          not null, primary key
#  predecessor_id         :integer
#  principal_developer_id :integer
#  name                   :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  country                :string(255)
#  established_on         :date
#  created_at             :datetime
#  updated_at             :datetime
#

class Developer < ActiveRecord::Base
  belongs_to    :predecessor,
    :class_name => "Developer"
  has_one       :successor,
    :class_name => "Developer",
    :foreign_key => "predecessor_id"

  belongs_to    :principal_developer,
    :class_name => "Developer"
  has_many      :subsidiary_developers,
    :class_name => "Developer",
    :foreign_key => "principal_developer_id"

  has_many      :releases
  has_many      :games, -> { uniq },
    :through => :releases

  validates :name,
    :presence => true
end
