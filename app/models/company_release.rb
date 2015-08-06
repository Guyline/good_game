class CompanyRelease < ActiveRecord::Base
  self.inheritance_column = :company_release_type

  belongs_to  :company
  belongs_to  :release

  validates :company,
    :presence => true,
    :uniqueness => {
      :scope => :release_id
    }
  validates :release,
    :presence => true
end