Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'register', sign_out: 'logout' }

  get 'about_me', to: 'pages#about', as: 'about_me'
  get 'contact', to: 'pages#contact'
  get 'tech_news', to: 'pages#tech_news'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  resources :portfolios do
    put :sort, on: :collection
  end

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
