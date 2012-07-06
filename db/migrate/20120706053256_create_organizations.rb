class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :organization_type
      t.string :state
      t.integer :unused_claim_store_days
      t.string :email

      t.timestamps
    end
  end
end
