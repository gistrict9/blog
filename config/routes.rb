Rails.application.routes.draw do

	# Routes
	get 'tags/:tag', to: 'tags#show', as: :tag

  # Resources
  resources :tags, only: [:index, :show]
  resources :articles

  # App root
  root 'articles#index'

end
