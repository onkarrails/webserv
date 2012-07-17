class AddActiveToOrganizations < ActiveRecord::Migration
  def change
  	add_column :organizations, :active, :boolean
  end
end
