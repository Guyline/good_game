# == Schema Information
#
# Table name: platforms
#
#  id          :integer          not null, primary key
#  producer_id :integer
#  name        :string(255)
#  released_on :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Platform < ActiveRecord::Base
  belongs_to :producer,
    :class_name => "Company"

  validates :producer,
    :presence => true

  validates :name,
    :presence => true,
    :uniqueness => true
end
