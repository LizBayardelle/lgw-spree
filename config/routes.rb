Rails.application.routes.draw do

  resources :profiles
  get 'home/index'
  root 'home#index'
  get 'home/blogs'

  resources :blogs
  resources :contacts

  get '/tagged', to: "blogs#tagged", as: :tagged
  get 'tags/:tag', to: 'blogs#index', as: :tag

  mount Spree::Core::Engine, at: '/store'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
