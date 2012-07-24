FactoryGirl.define do 
	sequence :email do |n|
		"email#{n}@example.com"
	end

	factory :organization do
		name 'org1'
		address_line1	 'address_line1'
		city 'city'
		state 'start'
		zip '54365'
		organization_type 'hsfkfs'
		email FactoryGirl.generate :email
	end
	
		factory :branch do
		name 'braghlknch'
		address_line1	 'sdshlkaddress_line1'
		city 'citsdklsjy'
		state 'startffdd'
		zip '54365'
		email FactoryGirl.generate :email
	end
end
