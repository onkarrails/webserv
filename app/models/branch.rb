class Branch < ActiveRecord::Base
  attr_accessible :email, :name, :state, :organization_id
  belongs_to :organization, :destroy_dependent => true
end
