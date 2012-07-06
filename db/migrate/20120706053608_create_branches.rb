class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :state
      t.string :email
      t.integer :organization_id

      t.timestamps
    end
  end
end
