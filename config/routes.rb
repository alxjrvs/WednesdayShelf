WednesdayShelf::Application.routes.draw do
  devise_for :users
  resources :users do
    resources :pull_lists, only: [:show]
    resources :pulls, only: [:create, :destroy]
    member do
      get :settings
    end
  end

   root 'home#index'
   resources :releases
   resources :issues, only: [:show] do
      get :add_to_list
      get :remove_from_list
   end
end
