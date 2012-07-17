Webserv::Application.routes.draw do
  resources :branches

  resources :organizations do
  	member do
  		post 'deactivate'
			post 'reactivate'
		end
	end
			
  devise_for :users

  root :to => 'organizations#index'

end
