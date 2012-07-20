class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  								:organizations, :organization_id, :first_name, :last_name, :phone, :mobile, :fax, :address_line_1,
                  :address_line_2, :city, :state, :zip, :active,
                  :branches, :organizations
  # attr_accessible :title, :body
	has_many :user_organizations
	has_many :organizations, :through => :user_organizations

#	validates :terms_agreements => true, :if => :signing_up? 
	
	before_validation :set_password
	
#	def self.find_by_email_or_create(email)
#    User.find_by_email(email) || create!(:email => email)
#  end
	
	def set_password
		self.password = generate_password if password.blank?
	end
	
	 def generate_password
    'password'
  end
	
#	def signing_up
#		new_record?
#	end
	
end
