class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.date :start_date
      t.integer :duration

      t.timestamps
    end
  end
end
