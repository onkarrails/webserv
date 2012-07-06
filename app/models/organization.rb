class Organization < ActiveRecord::Base
  attr_accessible :email, :name, :organization_type, :state, :unused_claim_store_days
  has_many :branches ,:destroy_dependent => true
end
