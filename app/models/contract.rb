class Contract < ActiveRecord::Base
  attr_accessible :duration, :start_date
	belongs_to :organization
	accepts_nested_attributes_for :organization
	
	validates :duration, :start_date, :presence => true
	
	def end_date
		start_date + duration.months
	end
end
