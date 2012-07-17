module Activation
	module Status
		ACTIVE = 'Active'
		INACTIVE = 'Deactivated'
		UNCONFIRMED = 'Not Confirmed'
		CONFIRMED  =	'Confirmed'
		NOTACCEPTED = 'TOS Not Accepted'
	end
	
	module ClassMethods
	end
	
	module InstanceMethods
		def inactive?
			try(:active) == false
		end
		
		def status
		end
		
		def reactivate
			self.active = true
		end 
		
		def deactivate
			self.active = false
		end 
		
		def update_activation(status)
			update_attribute(:active, status)
		end 
		
		module ControllerMethods
			def deactivate 
				@entity = model_class.find(params[:id])
				@entity.upadate_activation(false)
				redirect_to :back
			end 
			
			def reactivate
				@entity = model_class.find(params[:id])
				@entity.upadate_activation(true)
				redirect_to :back
			end 
			
			def model_class
				@model_class ||= self.class.to_s.gsub("controller", "").singularize.constantize
			end
			
			def self.included(receiver)
				receiver.extend         ClassMethods
				receiver.send :include, InstanceMethods
				receiver.scope :by_status, lambda {|state| receiver.where(:active => state.to_s =='true') if state.to_s != 'all'}
				receiver.scope :active, receiver.where(:active => true)
			end
		
		end 
		
	end	

end
