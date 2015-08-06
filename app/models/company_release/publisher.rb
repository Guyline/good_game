# == Schema Information
#
# Table name: company_releases
#
#  id                   :integer          not null, primary key
#  company_id           :integer
#  release_id           :integer
#  company_release_type :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class CompanyRelease::Publisher < CompanyRelease

end
