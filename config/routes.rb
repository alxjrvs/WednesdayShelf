WednesdayShelf::Application.routes.draw do
  devise_for :users

   root 'home#index'
   resources :releases
   resources :issues, only: [:show]
end
