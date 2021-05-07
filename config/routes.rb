# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'resgistration' },
             controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :products do
    collection do
      match 'search' => 'products#search', via: %i[get post], as: :search
    end
  end
  resources :categories do
    resources :products do
      collection do
        match 'search' => 'products#search', via: %i[get post], as: :search
      end
    end
  end
  root to: 'home#index'
end
