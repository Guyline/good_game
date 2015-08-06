# == Schema Information
#
# Table name: releases
#
#  id           :integer          not null, primary key
#  game_id      :integer
#  platform_id  :integer
#  developer_id :integer
#  publisher_id :integer
#  name         :string(255)
#  market       :string(255)
#  released_on  :date
#  created_at   :datetime
#  updated_at   :datetime
#

class Release < ActiveRecord::Base
  belongs_to      :game
  belongs_to      :platform
  belongs_to      :developer
  belongs_to      :publisher

  MARKETS = [
    MARKET_US = "US",
    MARKET_UK = "UK",
    MARKET_JAPAN = "Japan",
    MARKET_AUSTRALIA = "Australia"
  ]

  validates :market,
    :inclusion => {
      :in => MARKETS
    }

  validates :game_id,
    :presence => true
  validates :developer_id,
    :presence => true
  validates :publisher_id,
    :presence => true
  validates :platform_id,
    :presence => true,
    :uniqueness => {
      :scope => [
        :name,
        :market
      ]
    }

  def name
    read_attribute(:name) || game.try(:name)
  end
end
