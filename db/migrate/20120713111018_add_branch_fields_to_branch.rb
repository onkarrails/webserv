class AddBranchFieldsToBranch < ActiveRecord::Migration
  def change
  add_column :branches, :zip, :integer
  add_column :branches, :address_line1, :text
  add_column :branches, :address_line2, :text
  add_column :branches, :city, :string
  end
end
