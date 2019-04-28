Rails.application.routes.draw do
  resources :contacts
  get 'home/index'
  root 'home#index'

  
  mount Spree::Core::Engine, at: '/store'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
