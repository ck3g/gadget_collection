GadgetCollection::Application.routes.draw do
  devise_for :users

  resources :gadgets

  root 'welcome#index'
end
