Rails.application.routes.draw do
  resources :users
  get 'main/index'
  get 'main/help'
  get 'main/contacts'
  get 'main/about'
  post 'values/set_range_value'
  post 'session/create'
  delete 'session/destroy'
  get 'session/destroy'
  get 'work/profile'
  resources :images
  resources :values
  resources :themes
  root 'main#index'
  #todo: изменить root на 'main#index' после работы
  match 'api', to: 'api#index', via: :get
  match 'next_image', to: 'api#next_image', via: :get
  match 'work', to: 'work#index', via: 'get'
  match 'choose_theme', to: 'work#choose_theme', via: :get
  match 'display_theme', to: 'work#display_theme', via: :post
  match 'signin', to: 'session#new', via: :get
end
