class RenameDeveloperTypeToCompanyTypeOnCompanies < ActiveRecord::Migration
  def change
    rename_column :companies, :developer_type, :company_type
  end
end
