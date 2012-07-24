class Branch < ActiveRecord::Base
  attr_accessible :email, :name, :state, :organization_id, :address_line1, :address_line2, :zip
  validates :name,:state, :email, :address_line1,:zip, :presence => true
  validates :zip, :numericality => true
  validates :zip, :length => {:is => 5}
  
  belongs_to :organization
  accepts_nested_attributes_for :organization
   
end
