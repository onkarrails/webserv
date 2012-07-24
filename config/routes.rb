Webserv::Application.routes.draw do



	match 'home' => 'home#index', :via => :get
	
  resources :organizations do
  	member do
  		post 'deactivate'
			post 'reactivate'
		end
		
		resources :branches
	end
			
#	match 'users' => 'user#method', :via => :get
  devise_for :users

  root :to => 'organizations#index'

end
