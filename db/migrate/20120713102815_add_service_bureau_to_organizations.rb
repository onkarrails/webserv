class AddServiceBureauToOrganizations < ActiveRecord::Migration
  def change
  	add_column :organizations, :service_bureau, :boolean
  end
end
