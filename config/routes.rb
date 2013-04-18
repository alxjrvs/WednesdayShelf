Wednesdayshelf::Application.routes.draw do
  resources :releases
  root :to => 'releases#show'
end
