class AddEndDateToContracts < ActiveRecord::Migration
  def change
  	add_column :contracts, :end_date, :date
  end
end
