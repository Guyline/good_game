class RenamePrincipalDeveloperIdToPrincipalCompanyIdOnCompanies < ActiveRecord::Migration
  def change
    rename_column :companies, :principal_developer_id, :principal_company_id
  end
end
