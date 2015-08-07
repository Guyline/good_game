# == Schema Information
#
# Table name: companies
#
#  id                   :integer          not null, primary key
#  predecessor_id       :integer
#  principal_company_id :integer
#  name                 :string(255)
#  city                 :string(255)
#  state                :string(255)
#  country              :string(255)
#  established_on       :date
#  company_type         :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class Company < ActiveRecord::Base
  API_PREFIX = "3010"

  self.inheritance_column = :company_type

  belongs_to    :predecessor,
    :class_name => "Company"
  has_one       :successor,
    :class_name => "Company",
    :foreign_key => "predecessor_id"

  belongs_to    :principal_company,
    :class_name => "Company::Principal"

  # Releases/Games
  has_many      :company_releases
  has_many      :releases,
    :through => :company_releases
  has_many      :games, -> { uniq },
    :through => :releases

  # Releases/Games as Developer
  has_many      :developer_company_releases,
    :class_name => "CompanyRelease::Developer"
  has_many      :developer_releases,
    :through => :developer_company_releases,
    :source => :release
  has_many      :developed_games, -> { uniq },
    :through => :developer_releases,
    :source => :game

  # Releases/Games as Publisher
  has_many      :publisher_company_releases,
    :class_name => "CompanyRelease::Publisher"
  has_many      :publisher_releases,
    :through => :publisher_company_releases,
    :source => :release
  has_many      :published_games, -> { uniq },
    :through => :publisher_releases,
    :source => :game

  # Platforms
  has_many      :platforms,
    :foreign_key => "producer_id"

  validates :name,
    :presence => true

  def api_resource_id
    raise "No External ID" unless external_id?
    "#{API_PREFIX}-#{external_id}"
  end
end
