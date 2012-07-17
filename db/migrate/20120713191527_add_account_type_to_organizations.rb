class AddAccountTypeToOrganizations < ActiveRecord::Migration
  def change
  	add_column :organizations, :account_type, :string
  end
end
