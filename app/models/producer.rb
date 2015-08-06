# == Schema Information
#
# Table name: producers
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  city           :string(255)
#  state          :string(255)
#  country        :string(255)
#  established_on :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

class Producer < ActiveRecord::Base
  has_many :platforms

  validates :name,
    :presence => true,
    :uniqueness => true
end
