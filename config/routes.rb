Rails.application.routes.draw do
  resources :movie_result, only: [:new, :create, :show], controller: :movie_result

  root 'movie_result#new'
end