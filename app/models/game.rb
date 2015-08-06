# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  total_rating    :decimal(4, 2)
#  possible_rating :decimal(4, 2)    default(5.0), not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Game < ActiveRecord::Base
  has_many :releases
  has_many :platforms, -> { uniq },
    :through => :releases
  has_many :publishers, -> { uniq },
    :through => :releases,
    :source => :publisher
  has_many :developers, -> { uniq },
    :through => :releases,
    :source => :developer

  has_many :genres

  has_many :characters

  validates :name,
    :presence => true
end
