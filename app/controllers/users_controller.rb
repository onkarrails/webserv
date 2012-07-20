class UsersController < ApplicationController
 before_filter terms_and_conditions
	def edit
		@user = User.find(params[:id])
	end
	def update
		redirect_to organizations_path
	end
	
end
