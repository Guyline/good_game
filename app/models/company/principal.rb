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

class Company::Principal < Company
  has_many      :subsidiaries,
    :class_name => "Company",
    :foreign_key => "principal_company_id"

  has_many :releases,
    :through => :subsidiaries
end
