Rails.application.routes.draw do
  get 'reviews/new'
  get 'restaurants/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'restaurants', to: 'restaurants#index'
  # get 'restaurants/:id', to: 'restaurants#show', as: 'restaurant'
  resources :restaurants, only: [:index, :show, :new, :create] do
		resources :reviews, only: [:new, :create]
	end
end
