class UserMailer < ActionMailer::Base
   def invite_organization_admin(users,org)
 		@org = org
 		@user = users
 		puts @user.email
 		puts mail(:to => @user.email, :subject => "Welcome to webserv!!!!", :from => "support@altoserv.com")  
  end
end
