class AddTermsAndConditionsToUsers < ActiveRecord::Migration
  def change
		add_column :users, :terms_agreements, :boolean
  end
end
