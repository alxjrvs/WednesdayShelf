Wednesdayshelf::Application.routes.draw do
  resources :releases
  root :to => 'home#index'
end
