Rails.application.routes.draw do

  get 'home/index'
  root 'home#index'
  get 'home/blogs'

  get '/tagged', to: "blogs#tagged", as: :tagged
  get 'tags/:tag', to: 'blogs#index', as: :tag

  resources :blogs

  resources :contacts
  post "contacts/:id/mark_responded" => "contacts#mark_responded", as: "mark_responded"
  post "contacts/:id/mark_unresponded" => "contacts#mark_unresponded", as: "mark_unresponded"
  post "contacts/:id/mark_archived" => "contacts#mark_archived", as: "mark_archived"
  post "contacts/:id/mark_unarchived" => "contacts#mark_unarchived", as: "mark_unarchived"

  resources :profiles

  mount Spree::Core::Engine, at: '/store'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
