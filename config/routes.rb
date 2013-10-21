GadgetCollection::Application.routes.draw do
  devise_for :users

  resources :gadgets do
    resources :pictures
  end

  root 'welcome#index'
end
