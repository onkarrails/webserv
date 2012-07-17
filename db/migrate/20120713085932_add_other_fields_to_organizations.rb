class AddOtherFieldsToOrganizations < ActiveRecord::Migration
  def change
  	add_column :organizations, :address_line1, :text
  	add_column :organizations, :address_line2, :text
  	add_column :organizations, :city, :string
  	add_column :organizations, :zip, :integer
  	add_column :organizations, :accepted_threshold, :text
  end
end
