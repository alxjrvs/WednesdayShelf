WednesdayShelf::Application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :settings
      get :pull_list, as: :pull_list
    end
  end

   root 'home#index'
   resources :releases
   resources :issues, only: [:show] do
      get :add_to_list
      get :remove_from_list
   end
end
