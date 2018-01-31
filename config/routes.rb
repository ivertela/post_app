Rails.application.routes.draw do
	devise_for :users
	resources :users, only: [:index, :show, :destroy] do
		post 'soft_delete', to: 'users#soft_delete'
	end
	resources :posts
	post 'posts/published', to: 'posts#published', as: :published
	namespace :api, defaults: { format: 'json' } do
		resources :users, only: [:index, :show]
	end
	apipie
	root to: 'welcome#home'
end
