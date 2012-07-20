class Organization < ActiveRecord::Base
	include Activation
	
  attr_accessible :email, :name, :organization_type,  :city, :state, :address_line1, :address_line2,
  								:unused_claim_store_days, :branches_attributes, :branches, :zip, :accepted_threshold,
  								 :service_bureau, :users, :user_id, :active, :image
  has_many :branches, :dependent => :destroy
  has_many :user_organizations
  has_many :users, :through => :user_organizations
  has_one :contract, :dependent => :destroy
	belongs_to :gallery
  mount_uploader :image, ImageUploader	
		
  accepts_nested_attributes_for :branches, :contract
  validates :email, :name, :organization_type, :state, :city, :address_line1, :zip, :presence => true
  
	validates :zip, :numericality => true
	validates :zip, :length => { :is => 5}

	after_create :send_invitation
	def send_invitation
		user = self.users.create!(:email => self.email)
		UserMailer.invite_organization_admin(user, self).deliver
	end 
	




  module AccountType
  	STANDARD = "standard"
  end
   
end
