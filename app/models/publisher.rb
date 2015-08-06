# == Schema Information
#
# Table name: publishers
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  city           :string(255)
#  state          :string(255)
#  country        :string(255)
#  established_on :date
#  created_at     :datetime
#  updated_at     :datetime
#

class Publisher < ActiveRecord::Base
  has_many      :releases
  has_many      :games, -> { uniq },
    :through => :releases
end
