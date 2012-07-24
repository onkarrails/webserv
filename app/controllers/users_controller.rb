class UsersController < ApplicationController
 
	def index
	
	end 
	def edit
		@user = User.find(params[:id])
	end
	def update
		redirect_to organizations_path
	end
	
end
