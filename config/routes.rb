Rails.application.routes.draw do

  get 'stocks/index'

  get 'stocks/new'

  get 'stocks/edit'

  get 'stocks/show'

  root to: 'static_pages#welcome'

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          passwords: 'users/passwords',
          registrations: 'users/registrations'
  }

  resources :products
  resources :labs
  resources :stocks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
