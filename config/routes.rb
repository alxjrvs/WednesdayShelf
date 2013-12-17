WednesdayShelf::Application.routes.draw do
  devise_for :users
  resources :users, only: [:none] do
    member do
      get :settings
      get :pull_list, as: :pull_list
      post :add_issue, as: :add_issue_to_pull_list
      post :remove_issue, as: :remove_issue_from_pull_list
    end
  end

   root 'home#index'
   resources :releases
   resources :issues, only: [:show]
end
