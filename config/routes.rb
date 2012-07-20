Webserv::Application.routes.draw do
  resources :branches



  resources :organizations do
  	member do
  		post 'deactivate'
			post 'reactivate'
		end
	end
			
  devise_for :users

  resources :users
  root :to => 'organizations#index'

	

end
