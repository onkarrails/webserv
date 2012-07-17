class AddSearchEngineToOrganizations < ActiveRecord::Migration
  def change
  	add_column :organizations, :search_engine, :string
  end
end
