class UserOrganization < ActiveRecord::Base
  attr_accessible :organization_id, :user_id
	belongs_to :user
	belongs_to :organization
end
