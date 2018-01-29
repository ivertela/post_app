Rails.application.routes.draw do
	devise_for :users
	resources :users do
		get 'soft_delete', to: 'users#soft_delete' 
	end	
	resources :posts
	post 'posts/published', to: 'posts#published', as: :published
	apipie
	root to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
