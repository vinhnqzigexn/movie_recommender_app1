Rails.application.routes.draw do

  get 'recommenders/index'

  get 'recommenders/rate'

  get 'recommenders/show'

  resources :movie_genres
  devise_for :users

  resources :movies do
  	collection do
  		get 'search'
  	end
  	resources :reviews, except: [:show, :index]
  end

  root 'movies#index'

end
