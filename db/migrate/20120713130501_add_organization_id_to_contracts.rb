class AddOrganizationIdToContracts < ActiveRecord::Migration
  def change
  	add_column :contracts, :organization_id, :integer
  end
end
