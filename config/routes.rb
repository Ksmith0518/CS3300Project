Rails.application.routes.draw do
  resources :games
<<<<<<< HEAD
  root "projects#index"
  resources :projects
=======
  root "games#index"
  resources :games
>>>>>>> iteration01Dev
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
