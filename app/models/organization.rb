class Organization < ActiveRecord::Base
	include Activation
	
  attr_accessible :email, :name, :organization_type,  :city, :state, :address_line1, :address_line2,
  								:unused_claim_store_days, :branches_attributes, :branches, :zip, :accepted_threshold, :service_bureau
  has_many :branches, :dependent => :destroy
  has_one :contract, :dependent => :destroy
  accepts_nested_attributes_for :branches, :contract
  validates :email, :name, :organization_type, :state, :city, :address_line1, :zip, :presence => true
  
	validates :zip, :numericality => true
	validates :zip, :length => { :is => 5}




  module AccountType
  	STANDARD = "standard"
  end
   
end
